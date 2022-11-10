import 'package:enhanced_enums_and_go_router/pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Enums and Router demo',
      routerConfig: router,
    );
  }
}

enum AppRoutes {
  login('/login', LoginPage()),
  home('/home', HomePage()),
  settings('/settings', SettingsPage());

  const AppRoutes(
    this.path,
    this.view,
  );

  final String path;
  final Widget view;

  GoRoute get route => GoRoute(
        path: path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: view,
        ),
      );

  void go(BuildContext context) => context.go(path);
  void push(BuildContext context) => context.push(path);
  void replace(BuildContext context) => context.replace(path);
}

final router = GoRouter(
  initialLocation: AppRoutes.login.path,
  routes: [
    GoRoute(
      path: AppRoutes.login.path,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: AppRoutes.login.view,
      ),
    ),
    GoRoute(
      path: AppRoutes.home.path,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: AppRoutes.home.view,
      ),
    ),
    GoRoute(
      path: AppRoutes.settings.path,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: AppRoutes.settings.view,
      ),
    ),
  ],
);
