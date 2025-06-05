import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/planets/presentation/planet_detail.dart';
import '../../home.dart';
import '../../features/planets/presentation/planets_lists.dart';
import '../../shared/widgets/not_found.dart';
import '../../splash_screen.dart';

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

    GoRoute(
      path: '/planets',
      builder: (context, state) => const PlanetsLists(),
    ),
    GoRoute(
      path: '/planets/:planetName',
      builder: (context, state) {
        final planetName = state.pathParameters['planetName']!;
        return PlanetDetail(planetName: planetName);
      },
    ),
    GoRoute(path: '/not-found', builder: (context, state) => const NotFound()),
  ],
  errorPageBuilder: (context, state) => MaterialPage(child: const NotFound()),
);
