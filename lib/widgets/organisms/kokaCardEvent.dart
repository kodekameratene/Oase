import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget kokaCardEvent(
    {String title = "hello",
    String content =
        'Lorum ipsum dolor sit amet complesir met inet und a let nous aprenter',
    Color accentColor,
    String hours = '12',
    String minutes = '45',
      BuildContext context,
    onTapAction}) {
  return Container(
    decoration: new BoxDecoration(boxShadow: [
      new BoxShadow(
        color: Styles.colorShadowCardMain,
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ]),
    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
    child: Row(
      children: <Widget>[
        Container(
          height: 62,
          color: Colors.amber,
          width: 4,
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0))),
          color: Styles.kokaEventCardColorBackground,
          elevation: 0,
          margin: EdgeInsets.all(0),
          child: InkWell(
              splashColor: Styles.colorPrimary,
              child: Container(
                  height: 60,
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.1,
                        child: Column(
                          children: <Widget>[
                            Text(
                              "$hours",
                              style: Styles.textEventCardTimeHours,
                            ), Text(
                              "$minutes",
                              style: Styles.textEventCardTimeMinutes,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.6,
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
        ),
      ],
    ),
  );
}
