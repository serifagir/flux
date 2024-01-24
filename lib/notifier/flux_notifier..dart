import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class FluxNotifier with ChangeNotifier {
  bool isTimerRunning = false;
  bool isTimerPaused = false;

  List completedFluxes = [];

  void addCompletedFlux(int seconds) {
    completedFluxes.add(Flux(
        id: completedFluxes.length + 1,
        completedDate: DateTime.now(),
        seconds: seconds));
    notifyListeners();
  }

  bool isTickingSoundOn = true;
  bool isBackgroundSoundOn = true;
  bool isNotificationOn = true;
}
