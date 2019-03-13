import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  Widget build(context) {
    return ListView(
      children: <Widget>[
        ListTile(
//            leading: Text("Tirsdag\n19:00"),
            title: Text("Title"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
              'http://kodekameraten.no/img/Ansettelsesavtale.png',
//              'http://kodekameraten.no/img/hello.jpg',
              height: 100,
              width: 100,
            )),
        ListTile(
//            leading: Text(DateTime.now().day.toString()),
            title: Text("Hello"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
              'http://kodekameraten.no/img/Ansettelsesavtale.png',
              width: 100,
              height: 100,
            )),
        ListTile(
//            leading: Text(DateTime.now().day.toString()),
            title: Text("Hello"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
              'http://kodekameraten.no/img/hello.jpg',
              height: 100,
              width: 100,
            )),
        ListTile(
//            leading: Text(DateTime.now().day.toString()),
            title: Text("Hello"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
              'http://kodekameraten.no/img/hello.jpg',
              height: 100,
              width: 100,
            )),
        ListTile(
//            leading: Text(DateTime.now().day.toString()),
            title: Text("Hello"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
              'http://kodekameraten.no/img/hello.jpg',
              height: 100,
              width: 100,
            )),
        ListTile(
//            leading: Text(DateTime.now().day.toString()),
            title: Text("Hello"),
            subtitle: Text("Subtitle"),
            trailing: Image.network(
              'http://kodekameraten.no/img/hello.jpg',
              height: 100,
              width: 100,
            )),
      ],
    );
  }
}
