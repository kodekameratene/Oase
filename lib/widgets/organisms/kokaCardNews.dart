import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaCardNews(
    {String title = "hello",
    String content =
        'Lorum ipsum dolor sit amet complesir met inet und a let nous aprenter',
    onTapAction,
    BuildContext context,
    String topRight = "21:30",
    Color accentColor = Styles.colorPrimary}) {
  return Container(
    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 118,
          color: accentColor,
          width: 4,
        ),
        Card(
          color: Styles.kokaEventCardColorBackground,
          elevation: 8.0,
          margin: EdgeInsets.all(0),
          child: InkWell(
              splashColor: Styles.colorPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          height: 128,
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.76,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Styles.kokaCardNewsTextHeader),
                                    Text(content,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        softWrap: true,
                                        style: Styles.kokaCardNewsTextContent),
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
              onTap: () => onTapAction()),
        ),
      ],
    ),
  );
}
