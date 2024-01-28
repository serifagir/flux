import 'package:flutter/material.dart';

class SamuraiModeProvider extends ChangeNotifier {
  bool _isSamuraiMode = false;

  bool get isSamuraiMode => _isSamuraiMode;

  void toggleSamuraiMode() {
    _isSamuraiMode = !_isSamuraiMode;
    notifyListeners();
  }
}
