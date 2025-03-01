import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_scan_app/features/authentication/presentation/screens/bloc/auth_bloc.dart';
import 'package:qr_scan_app/features/authentication/presentation/screens/login.dart';
import 'package:qr_scan_app/features/init/presentation/screens/welcome_screen.dart';
import 'package:qr_scan_app/features/scan/presentation/screens/scan_wrapper_screen.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;

      if (authState is Authenticated) {
        return '/';
      } else if (authState is Unauthenticated) {
        return '/scan';
      }
      return null;
    },
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/scan',
        builder: (context, state) => const ScanWrapperScreen(),
      ),
    ],
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  final Stream stream;

  GoRouterRefreshStream(this.stream) {
    stream.listen((_) {
      notifyListeners();
    });
  }
}
