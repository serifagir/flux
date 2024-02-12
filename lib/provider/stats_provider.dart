import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class StatsProvider extends ChangeNotifier {
  int _totalTime = 0;

  List<Flux> _completedFluxes = [
    Flux(fluxDuration: 100, startDate: DateTime(2024, 2, 7, 0)),
    Flux(fluxDuration: 100, startDate: DateTime(2024, 2, 7, 8)),
    Flux(fluxDuration: 100, startDate: DateTime(2024, 2, 7, 12)),
    Flux(fluxDuration: 100, startDate: DateTime(2024, 2, 7, 19)),
    Flux(fluxDuration: 100, startDate: DateTime(2024, 2, 7, 23)),
  ];

  int get totalTime => _totalTime;

  void addCompletedFlux(Flux flux) {
    _completedFluxes.add(flux);
    print(_completedFluxes);
    notifyListeners();
  }

  void addTotalTime(int time) {
    _totalTime += time;
    notifyListeners();
  }

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

  Map<int, int> handleDailyFluxStats(DateTime date) {
    return {
      0: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 0)
                  .hour)
          .length,
      1: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 1)
                  .hour)
          .length,
      2: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 2)
                  .hour)
          .length,
      3: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 3)
                  .hour)
          .length,
      4: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 4)
                  .hour)
          .length,
      5: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 5)
                  .hour)
          .length,
      6: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 6)
                  .hour)
          .length,
      7: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 7)
                  .hour)
          .length,
      8: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 8)
                  .hour)
          .length,
      9: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 9)
                  .hour)
          .length,
      10: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 10)
                  .hour)
          .length,
      11: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 11)
                  .hour)
          .length,
      12: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12)
                  .hour)
          .length,
      13: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 13)
                  .hour)
          .length,
      14: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 14)
                  .hour)
          .length,
      15: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 15)
                  .hour)
          .length,
      16: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 16)
                  .hour)
          .length,
      17: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 17)
                  .hour)
          .length,
      18: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 18)
                  .hour)
          .length,
      19: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 19)
                  .hour)
          .length,
      20: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 20)
                  .hour)
          .length,
      21: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 12)
                  .hour)
          .length,
      22: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 22)
                  .hour)
          .length,
      23: _completedFluxes
          .where((flux) =>
              flux.startDate.hour ==
              DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 23)
                  .hour)
          .length,
    };
  }
}
