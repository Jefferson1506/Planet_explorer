import 'package:flutter/material.dart';
import 'shared/theme/theme_color.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = ColorTheme();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: colorTheme.lightTheme,
      title: 'Planet Explorer',
      home: const SplashSolarTheme(),
    );
  }
}
