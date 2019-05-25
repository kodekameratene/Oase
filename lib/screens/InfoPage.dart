import 'package:flutter/material.dart';
import 'package:jonah/screens/ContentViewerPage.dart';
import 'package:jonah/assets/mock_data/ContentPost.dart';

class InfoPage extends StatelessWidget {
  final List<ContentPost> _infoPosts = infoPosts;

  Widget build(context) {
    return ListView(
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
                          builder: (context) => ContentViewerPage(contentPost: post)),
                    );
                  },
                ))
            .toList());
  }
}
