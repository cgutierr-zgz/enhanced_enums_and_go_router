import 'package:enhanced_enums_and_go_router/app.dart';
import 'package:enhanced_enums_and_go_router/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  group('MyApp', () {
    testWidgets('renders LoginPage', (tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );
      expect(find.byType(LoginPage), findsOneWidget);
    });
  });

  group('Router', () {
    test('Routes', () {
      expect(AppRoutes.login.path, '/login');
      expect(AppRoutes.home.path, '/home');
      expect(AppRoutes.settings.path, '/settings');

      expect(AppRoutes.login.view, isA<LoginPage>());
      expect(AppRoutes.home.view, isA<HomePage>());
      expect(AppRoutes.settings.view, isA<SettingsPage>());

      expect(AppRoutes.login.route, isA<GoRoute>());
      expect(AppRoutes.home.route, isA<GoRoute>());
      expect(AppRoutes.settings.route, isA<GoRoute>());

      // Test the pageBuilder of route

      final loginRoute = AppRoutes.login.route;
      expect(
        loginRoute.pageBuilder,
        isA<MaterialPage<void> Function(BuildContext, GoRouterState)>(),
      );

      final homeRoute = AppRoutes.home.route;
      expect(
        homeRoute.pageBuilder,
        isA<MaterialPage<void> Function(BuildContext, GoRouterState)>(),
      );

      final settingsRoute = AppRoutes.settings.route;
      expect(
        settingsRoute.pageBuilder,
        isA<MaterialPage<void> Function(BuildContext, GoRouterState)>(),
      );

      // test the router

      final appRouter = router;
      expect(appRouter, isA<GoRouter>());
    });
  });
}
