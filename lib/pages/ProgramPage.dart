import 'dart:math';

import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/styles.dart';
import 'package:Oase/widgets/organisms/kokaCardEvent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProgramPage extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    var startTime = _convertStamp(document['startTime']);
    var formatterHours = new DateFormat('hh');
    var formatterMinutes = new DateFormat('mm');
    String hour = formatterHours.format(startTime).toString();
    String minutes = formatterMinutes.format(startTime).toString();


    List colors = [
      Colors.amber,
      Colors.red,
      Colors.blue,
      Styles.colorPrimary
    ];
    Random random = new Random();
    int index = random.nextInt(colors.length);


    return kokaCardEvent(
      title: document['title'] ?? '',
      content: document['subtitle'] ?? '',
      onTapAction: () {},
      hours: hour,
      minutes: minutes,
      accentColor: colors[index],
    );
  }

  Widget build(context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          title: AssetHelpers.getAppBarImage(),
          centerTitle: true,
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('Oase/rxpaqIfAPlWWK2D1SbRI/content')
                .where("category", isEqualTo: 'event')
                .orderBy("startTime")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: Text("Laster inn data..."));
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]));
            }),
      ),
    );
  }

  /// Firestore is returning a Timestamp object, which consists of seconds and
  /// nanoseconds. Oddly, on iOS you can just use a .toDate() and it works.
  /// But that breaks on Android as toDate() is not a method.
  /// So you can do a platform check if you want,
  /// but the universal solution is to use Firestore's Timestamp:
  /// https://stackoverflow.com/a/55226665
  DateTime _convertStamp(Timestamp _stamp) {
    if (_stamp != null) {
      return Timestamp(_stamp.seconds, _stamp.nanoseconds).toDate();
    } else {
      return null;
    }
  }
}
