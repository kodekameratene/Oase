import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/atoms/ColorStrip.dart';
import 'package:oase/widgets/atoms/TimeWidget.dart';

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
        ColorStrip(
          colorStart: colorStart,
          colorEnd: colorEnd,
          vertical: true,
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
                          TimeWidget(
                            hours: hours,
                            minutes: minutes,
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
