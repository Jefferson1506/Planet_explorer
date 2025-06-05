import 'package:shared_preferences/shared_preferences.dart';

enum AppTheme { light, dark }

class ThemePreference {
  static const _key = 'app_theme';

  Future<void> saveTheme(AppTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, theme.name);
  }

  Future<AppTheme> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString(_key);
    return AppTheme.values.firstWhere(
      (e) => e.name == themeString,
      orElse: () => AppTheme.light,
    );
  }
}
