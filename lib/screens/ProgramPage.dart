import 'package:flutter/material.dart';
import 'package:jonah/screens/ContentViewerPage.dart';
import 'package:jonah/src/ContentPost.dart';

class ProgramPage extends StatelessWidget {
  final List<ContentPost> _events = events;

  Widget build(context) {
    return ListView(
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
                          builder: (context) => ContentViewerPage()),
                    );
                  },
                ),
          )
          .toList(),
    );
  }
}
