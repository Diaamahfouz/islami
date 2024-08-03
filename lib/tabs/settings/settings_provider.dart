import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
   static ThemeMode   themeMode = ThemeMode.light;
  bool get isDark => themeMode == ThemeMode.dark;
  String language = 'en';

  SettingsProvider() {
    loadSettings();
  }

  String get backgroundImagePath =>
      'assets/images/${isDark ? 'dark' : 'default'}_bg.png';

  String get bodySebhaPath =>
      'assets/images/body_sebha_${isDark ? 'dark' : 'logo'}.png';

  String get headSebhaPath =>
      'assets/images/head_sebha_${isDark ? 'dark' : 'logo'}.png';

  void loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    themeMode = prefs.getBool('isDarkMode') ?? false ? ThemeMode.dark : ThemeMode.light;

    language = prefs.getString('language') ?? 'en';
    notifyListeners();
  }

  void changeThemeMode(ThemeMode selectedThemeMode) async {
    themeMode = selectedThemeMode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDark);
    notifyListeners();
  }

  Future<void> changeLanguage(String selectedLanguage) async {
    language = selectedLanguage;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
    notifyListeners();
  }
}
