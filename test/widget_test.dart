// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jonah/main.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('Pressing tab-icons triggers frames',
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // This just checks that the app builds, and triggers a frame.
      // Also it checks that the 3 main buttons exists with the correct icon and do something when tapped.

      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Tap the 'event' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.event));
      await tester.pump();

      // Tap the 'info' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.info));
      await tester.pump();

      // Tap the 'news' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.message));
      await tester.pump();
    });
  });
  testWidgets('Can open news-message', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Tap the 'news' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.message));
      await tester.pump();

      //Tap the first news-message and make sure that it triggers a frame.
      await tester.tap(find.byType(ListTile).first);
      await tester.pump();
    });
  });
  testWidgets('Can open news-message', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Tap the 'event' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.event));
      await tester.pump();

      //Tap the first news-message and make sure that it triggers a frame.
      await tester.tap(find.byType(ListTile).first);
      await tester.pump();
    });
  });

  testWidgets('Can open info-message', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(MyApp());

      // Tap the 'event' icon and trigger a frame.
      await tester.tap(find.byIcon(Icons.event));
      await tester.pump();

      //Tap the first news-message and make sure that it triggers a frame.
      await tester.tap(find.byType(ListTile).first);
      await tester.pump();
    });
  });
}
