// Basic widget test for UKR Solutions website

import 'package:flutter_test/flutter_test.dart';

import 'package:ukr_solutions_website/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const UKRSolutionsApp());
    await tester.pumpAndSettle();

    // Verify that the app loads with the company name
    expect(find.text('UKR Solutions'), findsWidgets);
  });
}
