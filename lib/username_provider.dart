import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsernameProvider extends ChangeNotifier {
  static const String _usernameKey = 'username_key';

  String _username = "";
  String get username => _username;

  UsernameProvider() {
    _loadUsername();
  }

  void _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username = prefs.getString(_usernameKey) ?? "";
    notifyListeners();
  }

  Future<void> saveUsername(String name) async {
    _username = name;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_usernameKey, name);
  }
}
