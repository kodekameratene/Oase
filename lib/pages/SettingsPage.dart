import 'package:Oase/helpers/appInfo_helper.dart';
import 'package:Oase/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: Styles.textAppBar,
          ),
          backgroundColor: Styles.colorPrimary,
        ),
        body: Column(
          children: <Widget>[
            Flexible(
                child: Container(
                  child: new GestureDetector(
                    onTap: () async {
                      const url = 'https://koka.no';
                      if (await canLaunch(url)
                      ) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text(
                      '${AppInfo.appName} v${AppInfo.version}\n ${AppInfo
                          .developers}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                  alignment: FractionalOffset(0.5, 0.9),
                )),
          ],
        ),
      ),
    );
  }
}

