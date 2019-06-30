import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oase/helpers/SharedPreferences.dart';
import 'package:oase/helpers/appInfo_helper.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/molecules/KokaButton.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Styles.colorBackgroundColorMain,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            title: Text(
              "Instillinger",
              style: Styles.textAppBar,
            ),
            backgroundColor: Styles.colorPrimary,
          ),
        ),
        body: Container(
          color: Styles.kokaEventCardColorBackground,
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.notifications_active,
                    color: Styles.colorSecondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Push-Varsler",
                      style: Styles.kokaCardNewsTextHeader,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Her kan du skru av og på varsler for de forskjellige sporene.",
                      style: Styles.kokaCardNewsTextContent,
                    ),
                  ),
                  buildPushSwitch('VoksenOase'),
                  buildPushSwitch('TenOase'),
                  buildPushSwitch('BoJoKo'),
                  KokaButton(
                    text: 'Personvernregler',
                    url: 'https://koka.no/oase/privacy-policy',
                  ),
                  KokaButton(
                    text: 'Lisens for kildekode',
                    url: 'https://github.com/kodekameratene/Oase/blob/develop/LICENSE',
                  ),
                  VersionInfoLabel(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPushSwitch(text) {
    return Column(
      children: <Widget>[
        new PushSwitch(
          pushKey: text,
        ),
        Divider(),
      ],
    );
  }
}

class PushSwitch extends StatefulWidget {
  PushSwitch({Key key, this.pushKey}) : super(key: key);
  final String pushKey;

  @override
  _PushSwitchState createState() => _PushSwitchState();
}

class _PushSwitchState extends State<PushSwitch> {
  FirebaseMessaging _fcm = FirebaseMessaging();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SharedPreferencesHelper.getPushValue(widget.pushKey),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            //This should not happen, since this is a local connection... :P
            return Text("No connection.");
            break;
          case ConnectionState.waiting:
            //This _does_ happen while we are waiting on the data
            //Let us return our switches turned off
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.pushKey),
                  Switch(
                    value: false,
                    onChanged: (bool value) {},
                    activeColor: Styles.colorSecondary,
                  ),
                ],
              ),
            );
            break;
          case ConnectionState.active:
            //This one is unlikely, since we only need one object... Read the doc ;)
            return Text("Active");
            break;
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(widget.pushKey),
                  Switch(
                    value: snapshot.data != null ? snapshot.data : false,
                    onChanged: (bool value) {
                      setState(() {
                        SharedPreferencesHelper.setPushValue(
                            widget.pushKey, value);
                      });
                    },
                    activeColor: Styles.colorSecondary,
                  ),
                ],
              ),
            );
            break;
        }
      },
    );
  }
}

class VersionInfoLabel extends StatelessWidget {
  const VersionInfoLabel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () async {
          const url = 'https://koka.no';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        child: Text(
          '${AppInfo.appName} v${AppInfo.version}\n ${AppInfo.developers}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black38),
        ),
      ),
    );
  }
}
