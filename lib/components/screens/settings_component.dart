import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jonah/styles.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          backgroundColor: Styles.colorPrimary,
        ),
        body: Center(
          child: Text(
            "Settings",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
