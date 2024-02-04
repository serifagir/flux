import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class StatsProvider extends ChangeNotifier {
  int _totalTime = 0;
  int _totalSessions = 0;

  final List<Flux> _completedFluxes = [
    Flux(
      fluxDuration: 100,
      date: DateTime.now(),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Flux(
      fluxDuration: 100,
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
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

  void dailyDataHandler(DateTime date) {
    _totalTime = 0;
    _totalSessions = 0;
    _completedFluxes.forEach((flux) {
      _totalSessions++;
      if (flux.date.day == date.day &&
          flux.date.month == date.month &&
          flux.date.year == date.year) {
        _totalTime += flux.fluxDuration;
      }
    });
    notifyListeners();
  }
}
