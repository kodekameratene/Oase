import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:jonah/screens/LocationSelectPage.dart';

void main() {
  testWidgets('Pressing tab-icons triggers frames',
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(LocationSelectPage());
    });
  });
}
