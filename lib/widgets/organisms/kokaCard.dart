import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/atoms/ColorStrip.dart';
import 'package:oase/widgets/atoms/TimeWidget.dart';

Widget kokaCard({
  String title = "hello",
  String content =
      'Lorum ipsum dolor sit amet complesir met inet und a let nous aprenter',
  onTapAction,
  Color colorStart = Styles.colorPrimary,
  Color colorEnd = Styles.colorSecondary,
  String topRight = "21:30",
  Color accentColor = Styles.colorPrimary,
  bool short = false,
  padding = const EdgeInsets.all(10),
  var date,
  String hours,
  String minutes,
  DocumentSnapshot document,
}) {
  return Padding(
    padding: padding,
    child: Container(
      decoration: new BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Styles.colorShadowCardMain,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ]),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTapAction,
          splashColor: colorStart,
          child: Column(
            children: <Widget>[
              ColorStrip(
                colorStart: colorStart,
                colorEnd: colorEnd,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    if (hours != null && minutes != null)
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: TimeWidget(
                          hours: hours,
                          minutes: minutes,
                        ),
                      ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _title(title, short),
                            _content(content, short),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Text _title(String title, bool short) {
  if (short) {
    return Text(title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Styles.kokaCardNewsTextHeader);
  }
  return Text(title, style: Styles.kokaCardNewsTextHeader);
}

Text _content(String content, bool short) {
  if (short) {
    return Text(content,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        softWrap: true,
        style: Styles.kokaCardNewsTextContent);
  }
  return Text(content, style: Styles.kokaCardNewsTextContent);
}
