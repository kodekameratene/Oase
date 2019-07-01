import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oase/helpers/SharedPreferences.dart';
import 'package:oase/helpers/appInfo_helper.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/molecules/KokaButton.dart';
import 'package:oase/widgets/molecules/PushSwitch.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool showSecrets = false;

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
                  buildSwitchButtonSection(),
                  KokaButton(
                    text: 'Erklæring om personvern',
                    url: 'https://koka.no/oase/privacy-policy',
                  ),
                  KokaButton(
                    text: 'Lisens for kildekode',
                    url:
                        'https://github.com/kodekameratene/Oase/blob/develop/LICENSE',
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

  Column buildSwitchButtonSection() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onDoubleTap: () => setState(() {
                showSecrets ? showSecrets = false : showSecrets = true;
              }),
          child: Icon(
            Icons.notifications_active,
            color: Styles.colorSecondary,
          ),
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
        buildPushSwitch('BoJoKo'),
//        buildPushSwitch('TenOase'),
        showSecrets ? buildPushSwitch('Developer') : SizedBox.shrink(),
      ],
    );
  }

  Widget buildPushSwitch(text, {bool highlight = false}) {
    return Column(
      children: <Widget>[
        new PushSwitch(pushKey: text, highlight: highlight),
        Divider(),
      ],
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
