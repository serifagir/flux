import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class FluxNotifier with ChangeNotifier {
  bool isTimerRunning = false;
  bool isBreakRunning = false;
  bool isBreakPaused = false;
  bool isTimerPaused = false;

  int session = 0;

  int countdownSeconds = 0;

  int currentFluxDuration = 15;
  int currentBreakDuration = 1;
  int currentLongBreakDuration = 0;
  int currentSessionCount = 2;

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
