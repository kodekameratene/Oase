import 'package:flutter/material.dart';
import 'package:jonah/screens/InfoPage.dart';
import 'package:jonah/screens/NewsPage.dart';
import 'package:jonah/screens/ProgramPage.dart';
import 'package:jonah/screens/SettingsPage.dart';
import 'package:jonah/styles.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                tooltip: 'Settings',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
            backgroundColor: Styles.colorPrimary,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message), text: "Meldinger"),
                Tab(icon: Icon(Icons.event), text: "Program"),
                Tab(icon: Icon(Icons.info), text: "Info"),
              ],
            ),
            title: Text('Jonah'),
          ),
          body: TabBarView(
            children: [NewsPage(), ProgramPage(), InfoPage()],
          ),
        ),
      ),
    );
  }
}
