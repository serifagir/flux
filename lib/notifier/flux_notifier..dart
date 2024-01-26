import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class FluxNotifier with ChangeNotifier {
  bool isTimerRunning = false;
  bool isBreakRunning = false;
  bool isBreakPaused = false;
  bool isTimerPaused = false;

  int session = 0;
// ----------------- Flux Sequence Settings ----------------- \\

  int currentFluxDuration = 30;
  int countdownSeconds = 0;
  int currentBreakDuration = 1;
  int currentLongBreakDuration = 0;
  int currentSessionCount = 2;

  void sequenceHandler(session, currentSessionCount) {
    if (session % currentSessionCount == 0 && session != 0) {
      print("long break");
    }
  }

  void calculateCountdownSeconds() {
    countdownSeconds = currentFluxDuration * 60;
    print(countdownSeconds);
    notifyListeners();
  }

  List completedFluxes = [];

  void addCompletedFlux(int seconds) {
    completedFluxes.add(Flux(
        id: completedFluxes.length + 1,
        completedDate: DateTime.now(),
        seconds: seconds));
    notifyListeners();
  }

  // ----------------- SoundSettings ----------------- \\
  bool isTickingSoundOn = true;
  bool isBackgroundSoundOn = true;
  bool isNotificationOn = true;
}
