import 'package:flutter/material.dart';
import 'package:jonah/screens/InfoPage.dart';
import 'package:jonah/screens/NewsPage.dart';
import 'package:jonah/screens/ProgramPage.dart';

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
            backgroundColor: Colors.teal,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.message)),
                Tab(icon: Icon(Icons.event)),
                Tab(icon: Icon(Icons.info)),
              ],
            ),
            title: Text('Oase 2019'),
          ),
          body: TabBarView(
            children: [
              NewsPage(),
              ProgramPage(),
              InfoPage()
            ],
          ),
        ),
      ),
    );
  }
}
