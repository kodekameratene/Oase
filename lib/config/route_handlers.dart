import 'package:Oase/helpers/content_helper.dart';
import 'package:Oase/pages/ContentViewerPage.dart';
import 'package:Oase/pages/HomePage.dart';
import 'package:Oase/pages/InfoPage.dart';
import 'package:Oase/pages/NewsPage.dart';
import 'package:Oase/pages/ProgramPage.dart';
import 'package:Oase/pages/demo_simple_component.dart';
import 'package:Oase/pages/settings_component.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../helpers/color_helpers.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new HomePage();
});

/// Handles deep links into the app
/// To test on Android:
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
var deepLinkHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String colorHex = params["color_hex"]?.first;
  String result = params["result"]?.first;
  Color color = new Color(0xFFFFFFFF);
  if (colorHex != null && colorHex.length > 0) {
    color = new Color(ColorHelpers.fromHexString(colorHex));
  }
  return new DemoSimpleComponent(
      message: "DEEEEEP LINK!!!", color: color, result: result);
});

var newsRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new NewsPage();
});

var programRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new ProgramPage();
});

var infoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new InfoPage();
});

var contentViewerRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // Todo: || Step 1. Get the content with id from database
  // Todo: || Step 2. Give it to the ContentViewer
  // Todo: || Step 3. => PROFIT!
  return new ContentViewerPage(ContentHelper.getInfo()[0]);
});

var settingsRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new SettingsPage();
});
