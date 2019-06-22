import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/organisms/KokaCard.dart';

import 'ContentViewerPage.dart';

class InfoPage extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return KokaCard(
        document: document,
        short: true,
        onTapAction: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContentViewerPage(document))));
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
                .collection('festival/G0OHb6fOBJEcLv4bUsvX/content')
                .where("page", arrayContains: 'info')
                .orderBy("index")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(child: Text("Laster inn data..."));
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) =>
                      _buildListItem(context, snapshot.data.documents[index]));
            }),
        backgroundColor: Styles.colorBackgroundColorMain,
      ),
    );
  }
}
