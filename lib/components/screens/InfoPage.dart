import 'package:flutter/material.dart';
import 'package:jonah/assets/mock_data/ContentPost.dart';
import 'package:jonah/helpers/asset_helpers.dart';
import 'package:jonah/helpers/content_helper.dart';
import 'package:jonah/styles.dart';

import 'ContentViewerPage.dart';

class InfoPage extends StatelessWidget {
  final List<ContentPost> _infoPosts = ContentHelper.getInfo();

  Widget build(context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: AssetHelpers.getAppBarImage(),
          backgroundColor: Styles.colorPrimary,
        ),
        body: ListView(
            children: _infoPosts
                .map((post) => ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.content),
                      trailing: Image.network(
                        post.img,
                        height: 100,
                        width: 100,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContentViewerPage(post)));
                      },
                    ))
                .toList()),
      ),
    );
  }
}
