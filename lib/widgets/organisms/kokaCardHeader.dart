import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaCardHeader(
    {String title = "hello",
      String content =
      'Lorum ipsum dolor sit amet complesir met inet und a let nous aprenter',
      onTapAction,
      BuildContext context,
      String topRight = "21:30",
      Color accentColor = Styles.colorPrimary,
      String category}) {
  return Container(
    key: Key(category),
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 10, top: 8, bottom: 8),
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            category,
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: "Times",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 128,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:
                                  MediaQuery.of(context).size.width * 0.74,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Styles.kokaCardNewsTextHeader),
                                      Text(content,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: true,
                                          style:
                                          Styles.kokaCardNewsTextContent),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
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
