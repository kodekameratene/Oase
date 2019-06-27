import 'package:flutter/widgets.dart';
import 'package:oase/styles.dart';
import 'package:oase/widgets/atoms/TimeWidget.dart';

class TimeWithTextWidget extends StatelessWidget {
  const TimeWithTextWidget({
    Key key,
    this.text,
    this.hours,
    this.minutes,
  }) : super(key: key);

  final String hours;
  final String minutes;
  final String text;

  @override
  Widget build(BuildContext context) {
    if (hours != null && minutes != null) {
      return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _text(text, true),
            TimeWidget(
              hours: hours,
              minutes: minutes,
            ),
          ]);
    } else {
      return SizedBox(
        width: 20.0,
        height: 30.0,
      );
    }
  }
}

Text _text(String subtitle, bool short) {
  return Text(subtitle,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: Styles.kokaCardNewsTextTopRight);
}
