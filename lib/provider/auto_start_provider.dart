import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoStartProvider with ChangeNotifier {
  late SharedPreferences _sharedPreferences;

  static late bool _autoStart;

  static bool get autoStart => _autoStart;

  AutoStartProvider() {
    loadAutoStartFromSharedPreferences();
  }

  void switchMode() {
    _autoStart = !_autoStart;
    saveAutoStartToSharedPreferences(_autoStart);
    notifyListeners();
  }

  Future<void> createSharedPreferencesInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveAutoStartToSharedPreferences(bool value) {
    _sharedPreferences.setBool("autoStart", value);
  }

  Future<void> loadAutoStartFromSharedPreferences() async {
    await createSharedPreferencesInstance();
    _autoStart = _sharedPreferences.getBool("autoStart") ?? true;
    notifyListeners();
  }
}
