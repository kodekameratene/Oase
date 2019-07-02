import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:oase/config/application.dart';
import 'package:oase/helpers/SharedPreferences.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/molecules/PushSwitch.dart';
import 'package:oase/widgets/organisms/kokaCardHeader.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  bool showWelcomeScreen = false;

  @override
  Widget build(BuildContext context) {
    SharedPreferencesHelper.getShouldShowStartupScreen().then((v) {
      showWelcomeScreen = v;
    });
    if (showWelcomeScreen) {
      return Material(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: AppBar(
              elevation: 0,
              title: AssetHelpers.getAppBarImage(),
              centerTitle: true,
              backgroundColor: Styles.colorPrimary,
            ),
          ),
          backgroundColor: Styles.colorPrimary,
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      "Velkommen til Oase!",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  color: Styles.colorBackgroundColorMain,
                  child: Column(
                    children: <Widget>[
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
                          "Vi vil gjerne sende deg push-meldinger for å informere deg om hva som skjer. "
                          "Hva vil du ha varsel om?",
                          style: Styles.kokaCardNewsTextContent,
                        ),
                      ),
                      PushSwitch(pushKey: 'TenOase'),
//                      PushSwitch(pushKey: 'VoksenOas e'),
//                      Divider(height: 0),
//                      PushSwitch(pushKey: 'BoJoKo'),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Wrap(
                          children: <Widget>[
                            Text(
                                "NB. Du kan når som helst ombestemme deg ved en senere anledning."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      SharedPreferencesHelper.setShouldShowStartupScreen(false);
                      setState(() {
                        showWelcomeScreen = false;
                      });
                    },
                    splashColor: Styles.colorSecondary,
                    child: Container(
                      color: Colors.white10,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.navigate_next,
                              size: 50,
                              color: Colors.white,
                            ),
                            Text(
                              "Gå videre",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Material(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: AssetHelpers.getAppBarImage(),
          centerTitle: true,
          backgroundColor: Styles.colorPrimary,
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Application.router.navigateTo(context, '/settings',
                  transition: TransitionType.fadeIn);
            },
          ),
        ),
      ),
      backgroundColor: Styles.colorBackgroundColorMain,
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            kokaCardHeader(
                categoryStyle: TextStyle(
                  fontSize: 28,
                  fontFamily: "Didot",
                ),
                category: "Nyheter",
                title: "Nyheter",
                content:
                    "Her sender vi deg meldinger om hva som skjer, når det skjer.",
                onTapAction: () => Application.router.navigateTo(
                    context, "/news",
                    transition: TransitionType.native)),
            kokaCardHeader(
                categoryStyle: TextStyle(
                  fontSize: 28,
                  fontFamily: "BungeeShade",
                ),
                category: "Program",
                title: "Program",
                content: "Her finner du programmet for uken.",
                onTapAction: () => Application.router.navigateTo(
                    context, "/program",
                    transition: TransitionType.native)),
            kokaCardHeader(
                categoryStyle: TextStyle(
                  fontSize: 28,
                  fontFamily: "Quattrocento_Sans",
                ),
                category: "informasjon",
                title: "Informasjon",
                content: "Her finner du relevant informasjon for en super uke.",
                onTapAction: () => Application.router.navigateTo(
                    context, "/info",
                    transition: TransitionType.native)),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sponsorer"),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => Application.router.navigateTo(context, "/sponsor",
                  transition: TransitionType.native),
              splashColor: Styles.colorPrimary,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      AssetHelpers.getMainSponsorImage(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Lær mer om våre sponsorer.",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
