import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:oase/helpers/convertTimeStamp_helper.dart';
import 'package:oase/helpers/mapCategoryToColor.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/atoms/ColorStrip.dart';
import 'package:oase/widgets/molecules/TimeWithTextWidget.dart';
import 'package:oase/helpers/date_helper.dart';
import 'package:oase/widgets/atoms/TitleWidget.dart';
import 'package:flutter/cupertino.dart';

class KokaCardInfo extends StatelessWidget {
  const KokaCardInfo({
    Key key,
    this.document,
    this.padding = const EdgeInsets.all(10),
    this.onTapAction,
    this.short = false,
  }) : super(key: key);

  final DocumentSnapshot document;
  final EdgeInsets padding;
  final onTapAction;
  final bool short;

  @override
  Widget build(BuildContext context) {
    String hours;
    String minutes;
    String weekdayDateMonth = '';
    String date = '';
    String location = '';
    if (_exists('startTime')) {
      weekdayDateMonth = getWeekdayDateMonth(document['startTime'] ?? '');
      date = getDateFromTimestamp(document['startTime'] ?? '');
      var startTime = convertStamp(document['startTime']);
      var formatterHours = new DateFormat('HH');
      var formatterMinutes = new DateFormat('mm');
      hours = formatterHours.format(startTime).toString();
      minutes = formatterMinutes.format(startTime).toString();
    }
    if (_exists('location')) location = document['location'];
    String hoursEnd;
    String minutesEnd;
    if (_exists('endTime')) {
      var startTime = convertStamp(document['endTime']);
      var formatterHours = new DateFormat('HH');
      var formatterMinutes = new DateFormat('mm');
      hoursEnd = formatterHours.format(startTime).toString();
      minutesEnd = formatterMinutes.format(startTime).toString();
    }
    String timePosted;
    if (_exists('timestamp')) {
      var timestamp = convertStamp(document['timestamp']);
      var formatter = new DateFormat('HH:mm dd/MM/yyyy');
      timePosted = formatter.format(timestamp).toString();
    }
    Color colorStart;
    Color colorEnd;
    if (_exists('category')) {
      colorStart = mapCategoryToStartColor(document['category'].toString());
      colorEnd = mapCategoryToEndColor(document['category'].toString());
    }
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
                Stack(
                  children: <Widget>[
                    Align(
                        alignment: Alignment(1, -1),
                        child: TimePostedField(timePosted: timePosted)),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            if (hours != null && minutes != null)
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                child: TimeWithTextWidget(
                                  text: "Fra: ",
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
                                    Column(
                                      children: <Widget>[
                                        title(weekdayDateMonth, short),
                                        ColorStrip(
                                          colorStart: Colors.black,
                                          colorEnd: Colors.black,
                                          thickness: 0.3,
                                          length: 130,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(CupertinoIcons.location),
                                            _content(location, short),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: TimeWithTextWidget(
                                text: "Til: ",
                                hours: hoursEnd,
                                minutes: minutesEnd,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Checks if the document have a field
  /// that matches the provided string.
  /// Returns True if the string does exist,
  /// and False if not.
  _exists(String s) {
    return ((document[s] ?? '') != '');
  }
}

class TimePostedField extends StatelessWidget {
  const TimePostedField({
    Key key,
    @required this.timePosted,
  }) : super(key: key);

  final String timePosted;

  @override
  Widget build(BuildContext context) {
    if (timePosted != null) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          timePosted,
          style: Styles.textCardTimePosted,
        ),
      );
    }
    return SizedBox.shrink();
  }
}

Text _content(String content, bool short) {
  if (short) {
    return Text(formatText(content),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: Styles.kokaCardNewsTextContent);
  }
  return Text(formatText(content), style: Styles.kokaCardNewsTextContent);
}

String formatText(String content) {
  return content.replaceAll("\\n", "\n");
}
