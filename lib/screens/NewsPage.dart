import 'package:flutter/material.dart';
import 'package:jonah/src/ContentPost.dart';

class NewsPage extends StatelessWidget {
  List<ContentPost> _newsPosts = newsPosts;

  Widget build(context) {
    return ListView(
        children: _newsPosts
            .map((post) => ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.content),
//                  trailing: Image.network(
//                    post.img,
//                    height: 100,
//                    width: 100,
//                  )
                ))
            .toList());
  }
}
