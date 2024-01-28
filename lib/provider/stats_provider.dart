import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class StatsProvider extends ChangeNotifier {
  int _totalTime = 0;

  List<Flux> _completedFluxes = [];

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
}
