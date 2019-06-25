import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'components/app/app_component.dart';

String _token;

void main() async {
//  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
//  _firebaseMessaging.requestNotificationPermissions();
//  _firebaseMessaging.getToken().then((token) {
//    print("fcm token is: \n$token");
//    _token = token;
//  });
//  _firebaseMessaging.subscribeToTopic("VoksenOase");
//
//  _firebaseMessaging.configure(
////      onMessage: processMessage,
////      onLaunch: processLaunch,
////      onResume
//      );

  runApp(new AppComponent());
}
