import 'dart:math';

import 'package:Oase/assets/mock_data/ContentPost.dart';
import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/helpers/content_helper.dart';
import 'package:Oase/styles.dart';
import 'package:Oase/widgets/organisms/kokaCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  final List<ContentPost> _newsPosts = ContentHelper.getNews();

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    List colors = [
      Colors.amber,
      Colors.red,
      Colors.blue,
      Styles.colorPrimary
    ];
    Random random = new Random();
    int index = random.nextInt(colors.length);
    return kokaCard(
      context: context,
      title: document['title'],
      content: document['content'],
      accentColor: colors[index],
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
                .where("category", isEqualTo: 'news')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text("Loading...");
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
