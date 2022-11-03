import 'package:base/src/views/forbidden/404NotFound.dart';
import 'package:base/src/views/root/base.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../test.dart';
import '../../views/root/parts/spare_viewa.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/",
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      name: "home",
      path: "/",
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          name: "settings",
          path: "settings/:name",
          builder: (context, state) {
            state.queryParams.forEach(
                  (key, value) {
                if (kDebugMode) {
                  print("$key:$value");
                }
              },
            );
            return SettingsPage(
              name: state.params["name"] ?? 'Settings',
            );
          }
        ),
      ]
    ),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child){
          return ApplicationRoot(child: child,);
        },
        routes: [
          GoRoute(
            path: '/a',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RootScreen(label: 'A', detailsPath: '/a/details'),
            ),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) => const DetailsScreen(label: 'A'),
              ),
            ],
          ),
          GoRoute(
            path: '/b',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RootScreen(label: 'B', detailsPath: '/b/details'),
            ),
            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) => const DetailsScreen(label: 'B'),
              ),
            ],
          ),
        ]
    ),
  ],
  errorBuilder: (context, state) => const ForbiddenRoute(),
);