import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oase/styles.dart';

//todo: Add support for DocumentSnapshot as param and show all fields relevant fields
Widget kokaCardEvent({
  String title,
  String content,
  Color colorStart,
  Color colorEnd,
  String hours = '--',
  String minutes = '--',
  onTapAction,
}) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 62,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [
                colorStart,
                colorEnd,
              ],
              begin: const FractionalOffset(1, 0),
              end: const FractionalOffset(0, 1),
            ),
          ),
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
                      height: 60,
                      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "$hours",
                                style: Styles.textEventCardTimeHours,
                              ),
                              Text(
                                "$minutes",
                                style: Styles.textEventCardTimeMinutes,
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles.textEventCardHeader),
                                  Text(content,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: true,
                                      style: Styles.textEventCardContent),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  onTap: () => onTapAction()),
            ),
          ),
        ),
      ],
    ),
  );
}
