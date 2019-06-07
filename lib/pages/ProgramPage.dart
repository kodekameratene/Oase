import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/styles.dart';
import 'package:Oase/widgets/organisms/kokaCardEvent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ProgramPage extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    var startTime = document['startTime'];
    var formatterHours = new DateFormat('hh');
    var formatterMinutes = new DateFormat('mm');
    String hour = formatterHours.format(startTime).toString();
    String minutes = formatterMinutes.format(startTime).toString();
    return kokaCardEvent(
      context: context,
      title: document['title'] ?? '',
      content: document['subtitle'] ?? '',
      onTapAction: () {},
      hours: hour,
      minutes: minutes,
    );
  }

  Widget build(context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          title: AssetHelpers.getAppBarImage(),
        ),
        body: StreamBuilder(
            stream: Firestore.instance
                .collection('Oase/rxpaqIfAPlWWK2D1SbRI/content')
                .where("category", isEqualTo: 'event')
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
}
