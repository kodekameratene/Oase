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
