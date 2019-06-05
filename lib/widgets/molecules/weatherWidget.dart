import 'package:Oase/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeatherWidget extends StatelessWidget {
  final String temperature;

  final String location;

  const WeatherWidget({Key key, this.temperature, this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Icon(
          Icons.wb_sunny,
          color: Styles.colorWeatherSunColor,
          size: 54,
        ),
        Text(temperature + "°",
            textAlign: TextAlign.start,
            style: Styles.weatherWidgetTextTemperature),
        Text(
          location,
          maxLines: 1,
          softWrap: false,
          textAlign: TextAlign.end,
          overflow: TextOverflow.fade,
          style: Styles.weatherWidgetTextLocation,
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}