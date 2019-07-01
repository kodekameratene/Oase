import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:oase/helpers/appInfo_helper.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/helpers/date_helper.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/organisms/DayButton.dart';
import 'package:oase/widgets/organisms/KokaCardEvent.dart';

import 'ContentViewerPage.dart';

class ProgramPage extends StatefulWidget {
  @override
  _ProgramPageState createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  List<DayButton> list = new List<DayButton>();
  List<String> days = new List<String>();
  List<String> daySeparators = new List<String>();

  Widget build(context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          title: AssetHelpers.getAppBarImage(),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            // Container(height: 60, child: dayButtonList()),
            Flexible(
              child: programList(),
            ),
          ],
        ),
        backgroundColor: Styles.colorBackgroundColorMain,
      ),
    );
  }

  Widget _buildProgramListItem(
      BuildContext context, DocumentSnapshot document, shouldShowNewDayLabel) {
    return (Column(
      children: <Widget>[
        KokaCardEvent(
            document: document,
            short: true,
            onTapAction: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContentViewerPage(document)),
                ))
      ],
    ));
  }

  Widget programList() {
    return (StreamBuilder(
        stream: Firestore.instance
            .collection(AppInfo.dbCollectionContent)
            .where("page", arrayContains: 'program')
            .orderBy("startTime")
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Laster inn data...")));
          days = [];
          daySeparators = new List<String>();
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                bool shouldShowNewDayLabel = index == 0 ? true : false;
                if (index > 0) {
                  int lastOne = index - 1;
                  if (getDayNumberFromTimestamp(
                          snapshot.data.documents[lastOne]["startTime"]) !=
                      getDayNumberFromTimestamp(
                          snapshot.data.documents[index]["startTime"])) {
                    shouldShowNewDayLabel = true;
                  }
                }
                bool shouldShowEvent = snapshot.data.documents[index]['track']
                    .toString()
                    .contains(AppInfo.mainTrack);
                return Column(
                  children: <Widget>[
                    shouldShowNewDayLabel
                        ? DayLabel(
                            document: snapshot.data.documents[index],
                          )
                        : SizedBox.shrink(),
                    shouldShowEvent
                        ? _buildProgramListItem(
                            context,
                            snapshot.data.documents[index],
                            shouldShowNewDayLabel)
                        : SizedBox.shrink(),
                  ],
                );
              });
        }));
  }

// Widget _buildButtonListItem(BuildContext context, DocumentSnapshot document) {
//   // watch_your_profanity
//   return DayButton(
//       date: getDayNumberFromTimestamp(document['startTime']),
//       day: getDayFromTimestamp(document["startTime"]));
// }

// Widget dayButtonList() {
//   return (StreamBuilder(
//       stream: instance,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData)
//           return Center(child: Text("Laster inn data..."));
//         days = [];
//         return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               String dayNumberFromTimestamp = getDayNumberFromTimestamp(
//                   snapshot.data.documents[index]["startTime"]);
//               if (!days.contains(dayNumberFromTimestamp)) {
//                 days.add(dayNumberFromTimestamp);
//                 return _buildButtonListItem(
//                     context, snapshot.data.documents[index]);
//               }
//               return SizedBox.shrink();
//             });
//       }));
// }
}

class DayLabel extends StatelessWidget {
  const DayLabel({Key key, this.document}) : super(key: key);
  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        getWeekdayDateMonth(document["startTime"]),
        style: Styles.textEventCardHeader,
      ),
    );
  }
}
