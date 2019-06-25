import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:oase/config/application.dart';
import 'package:oase/helpers/asset_helpers.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/organisms/kokaCardHeader.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          title: AssetHelpers.getAppBarImage(),
          centerTitle: true,
          backgroundColor: Styles.colorPrimary,
//Todo: Disabled until we have something to show
//          leading: IconButton(
//            icon: Icon(Icons.settings),
//            onPressed: () {
//              Application.router.navigateTo(context, '/settings',
//                  transition: TransitionType.fadeIn);
//            },
//          ),
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
          ],
        ),
      ]),
    ));
  }
}
