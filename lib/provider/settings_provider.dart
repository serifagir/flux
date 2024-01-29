import 'package:flutter/material.dart';
import 'package:flux/provider/auto_start_provider.dart';

class SettingsProvider extends ChangeNotifier {
  //---------------------- App Settings ---------------------//
  final autoStartProvider = AutoStartProvider();

  List<String> _languages = ['English', 'French', 'Spanish'];
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
    print(_autoStartNextSession);
    notifyListeners();
  }

  //---------------------- User Settings ---------------------//
  //---------------------- Other Settings ---------------------//
}
