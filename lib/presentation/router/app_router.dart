import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/ui/home/home_screen.dart';
import 'package:flutter_clean_riverpod/presentation/ui/main_home/main_home_screen.dart';
import 'package:go_router/go_router.dart';

import '../ui/favourite/favourite_screen.dart';
import '../ui/search/search_screen.dart';
import '../ui/setting/setting_screen.dart';

enum Routes {
  home(path: '/home'),
  search(path: '/search'),
  favourite(path: '/favourite'),
  setting(path: '/setting');

  const Routes({
    required this.path,
    this.nestedPath,
  });

  final String path;
  final String? nestedPath;
}

class AppRouter {
  AppRouter._internal();

  static final AppRouter _instance = AppRouter._internal();

  static AppRouter get instance => _instance;

  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final homeNavigationKey = GlobalKey<NavigatorState>();
  static final searchNavigatorKey = GlobalKey<NavigatorState>();
  static final favoriteNavigatorKey = GlobalKey<NavigatorState>();
  static final settingNavigatorKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainHomeScreen(
          navigationShell: navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: homeNavigationKey,
            routes: [
              GoRoute(
                path: Routes.home.path,
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: searchNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.search.path,
                builder: (context, state) => SearchScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: favoriteNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.favourite.path,
                builder: (context, state) => FavouriteScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: settingNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.setting.path,
                builder: (context, state) => SettingScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
