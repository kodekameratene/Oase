import 'package:flutter/material.dart';

abstract class Styles {
  // Colors
  static const colorPrimary = Color.fromRGBO(76, 165, 133, 1.0);
  static const colorSecondary = Color.fromRGBO(0, 58, 93, 1);
  static const colorWeatherBgStart = Color.fromRGBO(125, 209, 179, 1);
  static const colorWeatherBgEnd = Color.fromRGBO(76, 165, 133, 1);
  static const colorBackgroundColorMain = Color.fromRGBO(235, 235, 235, 1);
  static const colorWeatherTextColor = Colors.white;
  static const colorWeatherSunColor = Color.fromRGBO(255, 216, 0, 1);
  static var colorShadowCardMain = Color.fromRGBO(0, 0, 0, 0.06);


  // Images
  static const imgLogoMain = "lib/assets/sommeroase.png";
  static const imgLogoOase = "lib/assets/oase_neg.png";

//  TextStyles
  static var textAppBar = TextStyle(fontSize: 30, fontWeight: FontWeight.w200);

  static var textHeader = TextStyle(fontSize: 30, fontWeight: FontWeight.w200);
  static var textContent = TextStyle(fontSize: 12, fontWeight: FontWeight.w200);

  static var textCardHeader =
      TextStyle(fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.bold);
  static var textCardContent = TextStyle(
      fontSize: 12, fontFamily: "Lao Sangam MN", fontWeight: FontWeight.normal);

  static var weatherWidgetTextTemperature = TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w100,
      color: Styles.colorWeatherTextColor);

  static var weatherWidgetTextLocation =
      TextStyle(fontSize: 17, color: Styles.colorWeatherTextColor);


  static var kokaEventCardColorBackground = Color.fromRGBO(253, 253, 253, 1);
  static var textEventCardHeader =
  TextStyle(fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.bold);
  static var textEventCardContent = TextStyle(
      fontSize: 18, fontFamily: "Lao Sangam MN", fontWeight: FontWeight.normal);
  static var textEventCardTimeHours = TextStyle(
      fontFamily: "Lato", fontSize: 24, fontWeight: FontWeight.bold);
  static var textEventCardTimeMinutes = TextStyle(
      fontFamily: "AnticDidone", fontSize: 25, fontWeight: FontWeight.bold);


  static var kokaCardNewsTextHeader
  = TextStyle(fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.bold);
  static var kokaCardNewsTextContent
  = TextStyle(
      fontSize: 18, fontFamily: "Lao Sangam MN", fontWeight: FontWeight.normal);

  static var kokaCardNewsTextTopRight = TextStyle(
      color: Color.fromRGBO(0, 0, 0, 0.4), fontSize: 12);


}
