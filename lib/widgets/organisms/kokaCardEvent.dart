import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaEventCard(
    {String title = "hello",
    String content =
        'Lorum ipsum dolor sit amet complesir met inet und a let nous aprenter',
    Color accentColor,
    String hours = '12',
    String minutes = '45',
    onTapAction}) {
  return Card(
    color: Styles.kokaEventCardColorBackground,
    elevation: 8.0,
    margin: EdgeInsets.all(12),
    child: InkWell(
        splashColor: Styles.colorPrimary,
        child: Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 20,
                  child: Text(
                    "$hours\n"
                    "$minutes",
                    style: Styles.textEventCardTime,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.textEventCardHeader),
                      Text(content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: Styles.textEventCardContent),
                    ],
                  ),
                ),
              ],
            )),
        onTap: () => onTapAction()),
  );
}
