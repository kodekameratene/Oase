import 'package:flutter/material.dart';
import 'package:jonah/src/ContentPost.dart';

class ProgramPage extends StatelessWidget {
  List<ContentPost> _events = events;

  Widget build(context) {
    return ListView(
        children: _events
            .map(
              (post) => ListTile(
                    leading: Text(
                        "${post.startTime.month.toString().padLeft(2, '0')}/"
                        "${post.startTime.day.toString().padLeft(2, '0')}"
                        "\n${post.startTime.hour}:${post.startTime.minute}"),
                    title: Text(post.title),
                    subtitle: Text(post.content),
//                    trailing: Image.network(
//                      'http://kodekameraten.no/img/kodekameraten.jpg',
//                      height: 100,
//                      width: 100,
//                    ),
                  ),
            )
            .toList());
  }
}
