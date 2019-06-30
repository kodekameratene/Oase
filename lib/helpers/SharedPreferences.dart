import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
Takes care of all stuff that needs to be stored in the app.
 */
class SharedPreferencesHelper {
  static Future<bool> getPushValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getBool(key);
    return result;
  }

  static Future<bool> setPushValue(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final FirebaseMessaging _fcm = FirebaseMessaging();
    value ? _fcm.subscribeToTopic(key) : _fcm.unsubscribeFromTopic(key);
    bool result;
    await prefs.setBool(key, value).then((action) {
      result = action;
    });
    return result;
  }
}
