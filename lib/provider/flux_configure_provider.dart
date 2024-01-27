import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FluxConfigureProvider extends ChangeNotifier {
  late SharedPreferences _sharedPreferences;

  static late int _fluxDurationValue = 15;
  static late int _breakDurationValue;
  static late int _longBreakDurationValue;
  static late int _sessionCountValue;

  static int get fluxDurationValue => _fluxDurationValue;
  static int get breakDurationValue => _breakDurationValue;
  static int get longBreakDurationValue => _longBreakDurationValue;
  static int get sessionCountValue => _sessionCountValue;

  FluxConfigureProvider() {
    loadValueFromSharedPreferences();
  }

  void updateFluxDurationValue(int newValue) {
    _fluxDurationValue = newValue;
    saveValueToSharedPreferences("fluxDurationValue", _fluxDurationValue);
    notifyListeners();
  }

  void updateBreakDurationValue(int newValue) {
    _breakDurationValue = newValue;
    saveValueToSharedPreferences("breakDurationValue", _breakDurationValue);
    notifyListeners();
  }

  void updateLongBreakDurationValue(int newValue) {
    _longBreakDurationValue = newValue;
    saveValueToSharedPreferences(
        "longBreakDurationValue", _longBreakDurationValue);
    notifyListeners();
  }

  void updateSessionCountValue(int newValue) {
    _sessionCountValue = newValue;
    saveValueToSharedPreferences("sessionCountValue", _sessionCountValue);
    notifyListeners();
  }

  Future<void> createSharedPreferencesInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveValueToSharedPreferences(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }

  Future<void> loadValueFromSharedPreferences() async {
    await createSharedPreferencesInstance();
    _fluxDurationValue = _sharedPreferences.getInt("fluxDuration") ?? 25;
    _breakDurationValue = _sharedPreferences.getInt("breakDuration") ?? 5;
    _longBreakDurationValue =
        _sharedPreferences.getInt("longBreakDuration") ?? 15;
    _sessionCountValue = _sharedPreferences.getInt("sessionCount") ?? 4;
    notifyListeners();
  }
}
