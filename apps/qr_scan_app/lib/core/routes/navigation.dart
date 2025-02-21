import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:qr_scan_app/features/authentication/presentation/screens/login.dart';
import 'package:qr_scan_app/features/qr_scan_history/presentation/home.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LoginScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'home',
            builder: (context, state) => HomeScreen(),
          ),
        ],
      ),
    ],
  );
}
