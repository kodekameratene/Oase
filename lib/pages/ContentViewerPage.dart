import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oase/helpers/convertTimeStamp_helper.dart';
import 'package:oase/helpers/mapCategoryToColor.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/organisms/kokaCard.dart';
import 'package:oase/widgets/organisms/kokaCardEvent.dart';
import 'package:oase/widgets/molecules/fullScreenImage.dart';

class ContentViewerPage extends StatelessWidget {
  ContentViewerPage(this.document);

  final DocumentSnapshot document;

  @override
  Widget build(BuildContext context) {
    var startTime = convertStamp(document['startTime']);
    var formatterHours = new DateFormat('HH');
    var formatterMinutes = new DateFormat('mm');
    String hour;
    String minutes;
    if (_exists('startTime')) {
      hour = formatterHours.format(startTime).toString();
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
              child: Column(
                children: <Widget>[
                  if (_exists("title") && _exists("content") && _exists('startTime'))
                    kokaCardEvent(
                      title: document['title'] ?? '',
                      content: document['content'] ?? '',
                      hours: hour,
                      minutes: minutes,
                      colorStart: mapCategoryToStartColor(
                          document['category'].toString()),
                      colorEnd:
                          mapCategoryToEndColor(document['category'].toString()),
                    ),
                  img(context),
                  kokaCard(
                    title: document['title'] ?? '',
                    content: document['content'] ?? '',
                    colorStart: mapCategoryToStartColor(
                        document['category'].toString()),
                    colorEnd:
                        mapCategoryToEndColor(document['category'].toString()),
                    maxLinesContent: 100,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  // Note: This might not be the best way to do this,
  // but it was what I came up with in a time of need...
  // If you figure out a simpler way to solve this, please refactor. <3 - Henry
  List _buildView() {
    List<Widget> widgetList = [
      if (_exists("title") && _exists("content"))
        kokaCardEvent(title: document['title'], content: document['content']),
      if (_exists("content")) Text(document["content"]),
      if (_exists("location")) Text(document["location"]),
      if (_exists("img"))
        //img(context),
//      if (_exists("startTime"))
//        Text((document["startTime"] as Timestamp).toDate().toIso8601String()),
//      if (_exists("endTime"))
//        Text((document["endTime"] as Timestamp).toDate().toIso8601String()),
//      if (_exists("timestamp"))
//        Text((document["timestamp"] as Timestamp).toDate().toIso8601String()),
        if (_exists("url"))
          Text(document["url"]),
      if (_exists("category")) Text(document["category"].toString()),
      if (_exists("track")) Text(document["track"].toString()),
      if (_exists("linkedContent")) Text(document["linkedContent"].toString()),
    ];

    return List<Widget>.generate(widgetList.length, (int index) {
      return widgetList[index];
    });
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
          child: Hero(
            child: Image.network(
              document['img'],
            ),
            tag: 'imageCVP',
          ));
    }
    return SizedBox.shrink();
  }
}
