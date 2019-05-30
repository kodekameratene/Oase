import 'package:Oase/components/app/app_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {
  testWidgets('Navigating To Nyheter', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(AppComponent());
      await tester.tap(find.byKey(Key("Nyheter")));
      await tester.pump();
    });
  });
  testWidgets('Navigating To Program', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(AppComponent());
      await tester.tap(find.byKey(Key("Program")));
      await tester.pump();
    });
  });
  testWidgets('Navigating To Info', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(AppComponent());
      await tester.tap(find.byKey(Key("informasjon")));
      await tester.pump();
    });
  });
}
