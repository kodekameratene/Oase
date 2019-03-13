import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
//  Widget build(context) {
//    return PhotoView(
//      imageProvider:
//          NetworkImage('http://kodekameraten.no/img/Ansettelsesavtale.png'),
//    );
//  }
  Widget build(context) {
    return ListView(
      children: <Widget>[
        ListTile(
            title: Text("Title"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
//              'http://kodekameraten.no/img/Ansettelsesavtale.png',
              'http://kodekameraten.no/img/hello.jpg',
              height: 100,
              width: 100,
            )),
      ],
    );
  }
}
