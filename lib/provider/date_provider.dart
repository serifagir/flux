import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime _date = DateTime.now();

  DateTime get date => _date;

  Map<int, String> monthMap = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'July',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec',
  };

  void setDate(DateTime date) {
    _date = date;
    notifyListeners();
  }

  void incrementDate1Day() {
    _date = _date.add(const Duration(days: 1));
    notifyListeners();
  }

  void decrementDate1Day() {
    _date = _date.subtract(const Duration(days: 1));
    notifyListeners();
  }

  void incrementDate1Week() {
    _date = _date.add(const Duration(days: 7));
    notifyListeners();
  }

  void decrementDate1Week() {
    _date = _date.subtract(const Duration(days: 7));
    notifyListeners();
  }

  void incrementDate1Month() {
    _date = _date.add(const Duration(days: 30));
    notifyListeners();
  }

  void decrementDate1Month() {
    _date = _date.subtract(const Duration(days: 30));
    notifyListeners();
  }

  void incrementDate1Year() {
    _date = _date.add(const Duration(days: 365));
    notifyListeners();
  }

  void decrementDate1Year() {
    _date = _date.subtract(const Duration(days: 365));
    notifyListeners();
  }
}
