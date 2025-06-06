import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const _key = 'is_dark_mode';

  Future<void> saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDarkMode);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}
