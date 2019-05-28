import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jonah/helpers/asset_helpers.dart';
import 'package:jonah/styles.dart';

import '../../config/application.dart';

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
      //backgroundColor: Styles.colorBackgroundColorMain,
      backgroundColor: Styles.colorPrimary,
          body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              Styles.colorWeatherBg,
              Styles.colorBackgroundColorMain
            ],
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
                headingCard(context, "Nyheter", "/news"),
                headingCard(context, "Program", "/program"),
                headingCard(context, "informasjon", '/info'),
              ],
            ),
          ),
        ]),
      ),
    ));
  }

  Widget headingCard(BuildContext context, String title, String route) {
    return Card(
      key: Key(title),
      color: Color.fromRGBO(253, 253, 253, 1),
      elevation: 8.0,
      margin: EdgeInsets.all(10),
      child: InkWell(
        splashColor: Styles.colorPrimary,
        child: Container(
            height: 178,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 12, 20),
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Color.fromRGBO(112, 112, 112, 1),
                        ),
                        Text(
                          title,
//                          textScaleFactor: 2,
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: "Times",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 45, 10, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(
                            "At vero eos et just ei iusto",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Lato",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Lao Sangam MN",
                              fontWeight: FontWeight.normal),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
        onTap: () {
          tappedMenuButton(context, route);
        },
      ),
    );
  }

  // actions
  void tappedMenuButton(BuildContext context, String route) {
    Application.router
        .navigateTo(context, route, transition: TransitionType.native);
  }
}

class WeatherWidget extends StatelessWidget {
  final String temperature;

  final String location;

  const WeatherWidget({Key key, this.temperature, this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          Icons.wb_sunny,
          color: Styles.colorWeatherSunColor,
          size: 54,
        ),
        Text(
          temperature + "°",
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 45, fontWeight: FontWeight.w100, color: Styles.colorWeatherTextColor),
        ),
        Text(
          location,
          maxLines: 1,
          softWrap: false,
          textAlign: TextAlign.end,
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 17, color: Styles.colorWeatherTextColor),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
