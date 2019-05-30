import 'package:Oase/assets/mock_data/ContentPost.dart';
import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';

class LocationSelectPage extends StatelessWidget {
  final List<Location> _locations = locations;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text("Velg sted"), backgroundColor: Styles.colorPrimary),
            body: ListView(
                children: _locations
                    .map((post) => ListTile(
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            top: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          title: Text(post.title),
                          subtitle: Text(post.startTime.toLocal().toString()),
                          trailing: Image.network(
                            post.img,
                            height: 100,
                            width: 100,
                          ),
                          onTap: () => AlertDialog(
                                backgroundColor: Styles.colorPrimary,
                                title: Text(post.title),
                                content: Text("Select location"),
                              ),
                        ))
                    .toList())));
  }
}
