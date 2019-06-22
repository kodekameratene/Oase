import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:oase/helpers/convertTimeStamp_helper.dart';
import 'package:oase/helpers/mapCategoryToColor.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/atoms/ColorStrip.dart';
import 'package:oase/widgets/atoms/TimeWidget.dart';

class KokaCard extends StatelessWidget {
  const KokaCard({
    Key key,
    this.document,
    this.padding = const EdgeInsets.all(20),
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
    if (_exists('startTime')) {
      var startTime = convertStamp(document['startTime']);
      var formatterHours = new DateFormat('HH');
      var formatterMinutes = new DateFormat('mm');
      hours = formatterHours.format(startTime).toString();
      minutes = formatterMinutes.format(startTime).toString();
    }
    String timePosted;
    if (_exists('timestamp')) {
      var timestamp = convertStamp(document['timestamp']);
      var formatter = new DateFormat('HH:mm dd/MM/yyyy');
      timePosted = formatter.format(timestamp).toString();
    }
    final String title = document['title'] ?? '';
    final String content = document['content'] ?? '';
    final Color colorStart =
        mapCategoryToStartColor(document['category'].toString());
    final Color colorEnd =
        mapCategoryToEndColor(document['category'].toString());
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
