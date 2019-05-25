import 'package:flutter/material.dart';
import 'package:jonah/styles.dart';
import 'package:jonah/src/ContentPost.dart';

class ContentViewerPage extends StatelessWidget {
  ContentViewerPage({this.contentPost});
  final ContentPost contentPost;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Styles.colorPrimary,
        title: Text(contentPost.title),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: <Widget> [
              content(),
              img(),
              startTime(),
              endTime(),
              number(),
              url(),
              location(),
              showCategories(),
          ]
        ),
      ),
    ),
    );
  }
  Widget content() {
    return Text(contentPost.content);
  }
  Widget img() {
    return Image.network(
      contentPost.img,
      height: 100,
      width: 100,
    );
  }
  Widget startTime() {
    return Text(contentPost.startTime.toString());
  }
  Widget endTime() {
    return Text(contentPost.endTime.toString());
  }
  Widget number() {
    return Text(contentPost.number.toString());
  }
  Widget url() {
    return Text(contentPost.url.toString());
  }
  Widget location() {
    return Text(contentPost.location.toString());
  }
  Widget showCategories() {
    return Text(contentPost.showCategories.toString());
  }
}
