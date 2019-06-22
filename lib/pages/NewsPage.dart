import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/helpers/mapCategoryToColor.dart';
import 'package:oase/pages/ContentViewerPage.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/organisms/kokaCard.dart';

class NewsPage extends StatelessWidget {
  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    return kokaCard(
      title: document['title'],
      content: document['content'],
      short: true,
      colorStart: mapCategoryToStartColor(document['category'].toString()),
      colorEnd: mapCategoryToEndColor(document['category'].toString()),
      onTapAction: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => ContentViewerPage(document))),
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
                .collection('festival/G0OHb6fOBJEcLv4bUsvX/content')
                .where("page", arrayContains: 'news')
                .where("timestamp", isLessThanOrEqualTo: Timestamp.now())
                .orderBy("timestamp", descending: true)
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
