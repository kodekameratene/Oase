import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaCard(
    {String title = "hello",
    String content =
        'Lorum ipsum dolor sit amet complesir met inet und a let nous aprenter',
    onTapAction,
    String topRight = "21:30",
    Color accentColor = Styles.colorPrimary}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 118,
          color: accentColor,
          width: 4,
        ),
        Expanded(
          child: Container(
            decoration: new BoxDecoration(boxShadow: [
              new BoxShadow(
                color: Styles.colorShadowCardMain,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ]),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              color: Styles.kokaEventCardColorBackground,
              elevation: 0,
              margin: EdgeInsets.all(0),
              child: InkWell(
                  splashColor: Styles.colorPrimary,
                  child: Container(
                    height: 128,
                    padding: EdgeInsets.all(20),
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
                  onTap: () => onTapAction()),
            ),
          ),
        ),
      ],
    ),
  );
}
