import 'package:flutter/widgets.dart';
import 'package:oase/styles.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key key,
    this.hours,
    this.minutes,
  }) : super(key: key);

  final String hours;
  final String minutes;

  @override
  Widget build(BuildContext context) {
    if (hours != null && minutes != null) {
      return Column(
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
      );
    } else {
      return SizedBox(
        width: 20.0,
        height: 30.0,
      );
    }
  }
}
