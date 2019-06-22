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

  // AccentColors for our Categories
  //  Mat
  static var colorAccentCategoryFoodStart =  Color(0xff6DD3CE);
  static var colorAccentCategoryFoodEnd = Color(0xffC8E9A0);

  // Møte
  static var colorAccentCategoryMeetingStart = Color(0xffF7A278);
  static var colorAccentCategoryMeetingEnd = Color(0xffA13D63);

  // Seminar
  static var colorAccentCategorySeminarStart = Color(0xffA13D63);
  static var colorAccentCategorySeminarEnd = Color(0xff351E29);

  // Samling
  static var colorAccentCategoryGatheringStart =Color(0xffE5F4E3);
  static var colorAccentCategoryGatheringEnd = Color(0xff5DA9E9);

  // Konsert
  static var colorAccentCategoryConcertStart =Color(0xff5DA9E9);
  static var colorAccentCategoryConcertEnd = Color(0xff003F91);

  // Forestilling
  static var colorAccentCategoryPerformanceStart = Color(0xffFAF3DD);
  static var colorAccentCategoryPerformanceEnd = Color(0xff8FC0A9);

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

  static var textEventCardTimeHours =
      TextStyle(fontFamily: "Didot", fontSize: 20, fontWeight: FontWeight.bold);
  static var textEventCardTimeMinutes = TextStyle(
      fontFamily: "Didot", fontSize: 18, fontWeight: FontWeight.normal);

  static var kokaCardNewsTextHeader =
      TextStyle(fontSize: 20, fontFamily: "Lato", fontWeight: FontWeight.bold);
  static var kokaCardNewsTextContent = TextStyle(
      fontSize: 18, fontFamily: "Lao Sangam MN", fontWeight: FontWeight.normal);

  static var kokaCardNewsTextTopRight =
      TextStyle(color: Color.fromRGBO(0, 0, 0, 0.4), fontSize: 12);
}
