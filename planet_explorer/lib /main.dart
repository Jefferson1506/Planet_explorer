import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'shared/theme/theme_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = ColorTheme();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: colorTheme.lightTheme,
      title: 'Planet Explorer',
      routerConfig: router,
    );
  }
}
