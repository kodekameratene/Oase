import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oase/helpers/convertTimeStamp_helper.dart';
import 'package:oase/helpers/mapCategoryToColor.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/molecules/fullScreenImage.dart';
import 'package:oase/widgets/organisms/kokaCard.dart';

class ContentViewerPage extends StatelessWidget {
  ContentViewerPage(this.document);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    String hours;
    String minutes;
    if (_exists('startTime')) {
      var startTime = convertStamp(document['startTime']);
      var formatterHours = new DateFormat('HH');
      var formatterMinutes = new DateFormat('mm');
      hours = formatterHours.format(startTime).toString();
      minutes = formatterMinutes.format(startTime).toString();
    }
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          title: Text(document["title"]),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  img(context),
                  kokaCard(
                    title: document['title'] ?? '',
                    content: document['content'] ?? '',
                    colorStart: mapCategoryToStartColor(
                        document['category'].toString()),
                    colorEnd:
                        mapCategoryToEndColor(document['category'].toString()),
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    hours: hours,
                    minutes: minutes,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  /// Checks if the document have a field
  /// that matches the provided string.
  /// Returns True if the string does exist,
  /// and False if not.
  _exists(String s) {
    return ((document[s] ?? '') != '');
  }

  Widget img(context) {
    if (_exists('img')) {
      return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return FullScreenPage(img: document['img']);
            }));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: Image.network(
              document['img'],
              fit: BoxFit.cover,
            ),
          ));
    }
    return Container(
      height: 10,
    );
  }
}
