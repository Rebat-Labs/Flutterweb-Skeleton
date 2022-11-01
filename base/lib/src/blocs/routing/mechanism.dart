import 'package:base/src/views/forbidden/404NotFound.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../../views/test.dart';

final GoRouter router = GoRouter(
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
  ],
  errorBuilder: (context, state) => const ForbiddenRoute(),
);