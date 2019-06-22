import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:oase/helpers/convertTimeStamp_helper.dart';
import 'package:oase/helpers/mapCategoryToColor.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/atoms/ColorStrip.dart';
import 'package:oase/widgets/atoms/TimeWidget.dart';

class KokaCardEvent extends StatelessWidget {
  const KokaCardEvent({
    Key key,
    this.document,
    this.onTapAction,
  }) : super(key: key);

  final DocumentSnapshot document;
  final onTapAction;

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
    final String title = _exists('title') ? document['title'] : '';
    final String content = _exists('content') ? document['content'] : '';
    final Color colorStart = _exists('colorStart')
        ? mapCategoryToStartColor(document['category'].toString())
        : mapCategoryToStartColor('default');
    final Color colorEnd = _exists('colorEnd')
        ? mapCategoryToEndColor(document['category'].toString())
        : mapCategoryToEndColor('default');
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
                        margin: EdgeInsets.fromLTRB(18, 8, 20, 10),
                        child: Row(
                          children: <Widget>[
                            TimeWidget(
                              hours: hours,
                              minutes: minutes,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 18, top: 5),
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

  /// Checks if the document have a field
  /// that matches the provided string.
  /// Returns True if the string does exist,
  /// and False if not.
  _exists(String s) {
    return ((document[s] ?? '') != '');
  }
}
