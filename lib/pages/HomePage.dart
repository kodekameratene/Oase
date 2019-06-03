import 'package:Oase/config/application.dart';
import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/styles.dart';
import 'package:Oase/widgets/molecules/weatherWidget.dart';
import 'package:Oase/widgets/organisms/kokaCard.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      appBar: AppBar(
        title: AssetHelpers.getAppBarImage(),
        backgroundColor: Styles.colorPrimary,
        leading: IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            Application.router.navigateTo(context, '/settings',
                transition: TransitionType.fadeIn);
          },
        ),
      ),
      backgroundColor: Styles.colorPrimary,
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Styles.colorWeatherBg, Styles.colorBackgroundColorMain],
            begin: const FractionalOffset(0.5, 0),
            end: const FractionalOffset(0.5, 0.2),
            stops: [0, 1],
            tileMode: TileMode.clamp,
          ),
        ),
        child: ListView(children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 81,
            child: WeatherWidget(
              temperature: "23",
              location: "Fredrikstad",
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                kokaCard(
                    category: "Nyheter",
                    title: "Tittel",
                    content:
                        "Nyhets conteent something ipsum dolor sit amet cant follow all this text. Soon to be clipped because we only can show three lines",
                    onTapAction: () => Application.router.navigateTo(
                        context, "/news",
                        transition: TransitionType.native)),
                kokaCard(
                    category: "Program",
                    title: "Tittel",
                    content:
                        "Program content something ipsum dolor sit amet cant follow all this text. Soon to be clipped because we only can show three lines",
                    onTapAction: () => Application.router.navigateTo(
                        context, "/program",
                        transition: TransitionType.native)),
                kokaCard(
                    category: "informasjon",
                    title: "Tittel",
                    content:
                        "Nyhets conteent something ipsum dolor sit amet cant follow all this text. Soon to be clipped because we only can show three lines",
                    onTapAction: () => Application.router.navigateTo(
                        context, "/info",
                        transition: TransitionType.native)),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
