import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/theme_preference.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final _preference = ThemePreference();

  ThemeNotifier() : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = await _preference.getTheme();
    state = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final isCurrentlyDark = state == ThemeMode.dark;
    final isNowDark = !isCurrentlyDark;

    state = isNowDark ? ThemeMode.dark : ThemeMode.light;
    await _preference.saveTheme(isNowDark);
  }
}
