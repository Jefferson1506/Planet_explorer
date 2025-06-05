// lib/providers/theme_provider.dart
import 'package:flutter/material.dart';
import '../../../shared/theme/theme_color.dart';
import '../models/theme_preference.dart';

class ThemeNotifier extends ChangeNotifier {
  final ThemePreference _preference = ThemePreference();
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  ThemeData get lightTheme => ColorTheme().lightTheme;
  ThemeData get darkTheme => ColorTheme().darkTheme;
  ThemeNotifier() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final isDark = await _preference.getTheme();
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final isCurrentlyDark = _themeMode == ThemeMode.dark;
    _themeMode = isCurrentlyDark ? ThemeMode.light : ThemeMode.dark;
    await _preference.saveTheme(_themeMode == ThemeMode.dark);
    notifyListeners();
  }
}
