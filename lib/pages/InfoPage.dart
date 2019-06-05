import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return GestureDetector(
      onTap: () => print(document.data),
      child: Card(
        child: Column(
          children: <Widget>[
            Text(document["title"] ?? '-'),
            Text(document["subtitle"] ?? '-'),
            Text(document['content'] ?? '-'),
            Text(document['location'] ?? '-'),
            Text(
                (document['startTime'] ?? Timestamp.now()).toDate().toString()),
            Text((document['endTime'] ?? Timestamp.now()).toDate().toString()),
            Image.network(document['img'] ?? '-')
          ],
        ),
      ),
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
                .where("category", isEqualTo: 'info')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]));
            }),
      ),
    );
  }
}