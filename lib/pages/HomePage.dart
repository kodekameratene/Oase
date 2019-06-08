import 'package:Oase/config/application.dart';
import 'package:Oase/helpers/asset_helpers.dart';
import 'package:Oase/styles.dart';
import 'package:Oase/widgets/molecules/weatherWidget.dart';
import 'package:Oase/widgets/organisms/kokaCardHeader.dart';
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(72),
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
      backgroundColor: Styles.colorPrimary,
      body: Container(
        color: Styles.colorBackgroundColorMain,
        child: ListView(children: <Widget>[
          Container(
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Styles.colorShadowCardMain,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ]),
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Styles.colorWeatherBgEnd,
                    Styles.colorWeatherBgStart,
                  ],
                  begin: const FractionalOffset(2.8, 0),
                  end: const FractionalOffset(0.2, 5),
                  stops: [0.5, 1],
                  tileMode: TileMode.clamp,
                ),
              ),
              padding: EdgeInsets.all(10),
              height: 81,
              child: WeatherWidget(
                temperature: "23",
                location: "Fredrikstad",
              ),
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                kokaCardHeader(
                    categoryStyle: TextStyle(
                      fontSize: 28,
                      fontFamily: "Didot",
                    ),
                    context: context,
                    category: "Nyheter",
                    title: "Tittel",
                    content:
                    "Nyhets conteent something ipsum dolor sit amet cant follow all this text. Soon to be clipped because we only can show three lines",
                    onTapAction: () => Application.router.navigateTo(
                        context, "/news",
                        transition: TransitionType.native)),
                kokaCardHeader(
                    categoryStyle: TextStyle(
                      fontSize: 28,
                      fontFamily: "BungeeShade",
                    ),
                    context: context,
                    category: "Program",
                    title: "Tittel",
                    content:
                    "Program content something ipsum dolor sit amet cant follow all this text. Soon to be clipped because we only can show three lines",
                    onTapAction: () => Application.router.navigateTo(
                        context, "/program",
                        transition: TransitionType.native)),
                kokaCardHeader(
                    categoryStyle: TextStyle(
                      fontSize: 28,
                      fontFamily: "Quattrocento_Sans",
                    ),
                    context: context,
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
