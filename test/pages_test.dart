import 'package:enhanced_enums_and_go_router/app.dart';
import 'package:enhanced_enums_and_go_router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Pages', () {
    testWidgets(
        'Can go to HomePage -> Login -> Home -> Settings -> Home -> Login',
        (tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);

      expect(find.widgetWithText(TextButton, 'Home'), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, 'Home'));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);

      expect(find.widgetWithText(TextButton, 'Logout'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      expect(find.byType(SettingsPage), findsOneWidget);
      expect(find.text('Settings'), findsNWidgets(2)); // Text, and AppBar

      expect(find.byType(BackButton), findsOneWidget);

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomePage), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);

      expect(find.widgetWithText(TextButton, 'Logout'), findsOneWidget);
      expect(find.byIcon(Icons.settings), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, 'Logout'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });
  });
}
