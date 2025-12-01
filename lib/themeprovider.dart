import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  static const String _themeKey = 'theme_Key';

  Themeprovider(){
    _loadTheme();
  }

  void _loadTheme() async{
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void toggleTheme(bool isOn) async{
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    final Prefs = await SharedPreferences.getInstance();
    Prefs.setBool(_themeKey, isOn);
  }
}
