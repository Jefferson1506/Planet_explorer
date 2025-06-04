import 'package:go_router/go_router.dart';

import '../features/planets/presentation/home.dart';
import '../splash_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashSolarTheme()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
  ],
);
