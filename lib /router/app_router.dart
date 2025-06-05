import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/planets/presentation/home.dart';
import '../splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SplashSolarTheme(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
    ),
    GoRoute(
      path: '/home',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const HomePage(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
    ),
  ],
);
