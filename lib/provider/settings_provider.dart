import 'package:flutter/material.dart';
import 'package:flux/provider/auto_start_provider.dart';
import 'package:wakelock/wakelock.dart';

class SettingsProvider extends ChangeNotifier {
  //---------------------- App Settings ---------------------//
  final autoStartProvider = AutoStartProvider();

  List<String> _languages = ['English'];
  String _selectedLanguage = 'English';

  bool _autoStartNextSession = true;
  bool _screenAlwaysOn = false;

  List _blockedApps = [];

  List<String> get languages => _languages;
  String get selectedLanguage => _selectedLanguage;
  bool get autoStartNextSession => _autoStartNextSession;
  bool get screenAlwaysOn => _screenAlwaysOn;
  List get blockedApps => _blockedApps;

  void setLanguage(String language) {
    _selectedLanguage = language;
    notifyListeners();
  }

  void setAutoStart(bool value) {
    _autoStartNextSession = value;
    autoStartProvider.switchMode();
    notifyListeners();
  }

  void setScreenAlwaysOn(bool value) {
    _screenAlwaysOn = value;
    if (_screenAlwaysOn) {
      Wakelock.enable();
    } else {
      Wakelock.disable();
    }
    notifyListeners();
  }

  void handleScreenAlwaysOn() {
    if (_screenAlwaysOn) {
      _screenAlwaysOn = false;
    } else {
      _screenAlwaysOn = true;
    }
    notifyListeners();
  }

  //---------------------- User Settings ---------------------//
  //---------------------- Other Settings ---------------------//
}
//  FluxConfigureProvider() {
//     loadValueFromSharedPreferences();
//   }

//   void updateFluxDurationValue(int newValue) {
//     _fluxDurationValue = newValue;
//     saveValueToSharedPreferences("fluxDurationValue", _fluxDurationValue);
//     notifyListeners();
//   }

//   void updateBreakDurationValue(int newValue) {
//     _breakDurationValue = newValue;
//     saveValueToSharedPreferences("breakDurationValue", _breakDurationValue);
//     notifyListeners();
//   }

//   void updateLongBreakDurationValue(int newValue) {
//     _longBreakDurationValue = newValue;
//     saveValueToSharedPreferences(
//         "longBreakDurationValue", _longBreakDurationValue);
//     notifyListeners();
//   }

//   void updateSessionCountValue(int newValue) {
//     _sessionCountValue = newValue;
//     saveValueToSharedPreferences("sessionCountValue", _sessionCountValue);
//     notifyListeners();
//   }

//   Future<void> createSharedPreferencesInstance() async {
//     _sharedPreferences = await SharedPreferences.getInstance();
//   }

//   saveValueToSharedPreferences(String key, int value) {
//     _sharedPreferences.setInt(key, value);
//   }

//   Future<void> loadValueFromSharedPreferences() async {
//     await createSharedPreferencesInstance();
//     _fluxDurationValue = _sharedPreferences.getInt("fluxDurationValue") ?? 25;
//     _breakDurationValue = _sharedPreferences.getInt("breakDurationValue") ?? 5;
//     _longBreakDurationValue =
//         _sharedPreferences.getInt("longBreakDurationValue") ?? 15;
//     _sessionCountValue = _sharedPreferences.getInt("sessionCountValue") ?? 4;
//     notifyListeners();
//   }
// }