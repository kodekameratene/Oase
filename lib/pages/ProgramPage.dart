import 'package:Oase/assets/mock_data/ContentPost.dart';
import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/helpers/content_helper.dart';
import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';

import 'ContentViewerPage.dart';

class ProgramPage extends StatelessWidget {
  final List<ContentPost> _events = ContentHelper.getEvents();

  Widget build(context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.colorPrimary,
          title: AssetHelpers.getAppBarImage(),
        ),
        body: ListView(
          children: _events
              .map(
                (post) => ListTile(
                      leading: Text(
                        "${post.startTime.month.toString().padLeft(2, '0')}/"
                        "${post.startTime.day.toString().padLeft(2, '0')}"
                        "\n${post.startTime.hour}:${post.startTime.minute}",
                      ),
                      title: Text(post.title),
                      subtitle: Text(
                        post.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
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
                    ),
              )
              .toList(),
        ),
      ),
    );
  }
}
