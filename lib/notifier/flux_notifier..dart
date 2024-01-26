import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

class FluxNotifier with ChangeNotifier {
  bool isTimerRunning = false;
  bool isBreakRunning = false;
  bool isBreakPaused = false;
  bool isTimerPaused = false;

// ----------------- Flux Sequence Settings ----------------- \\
  int session = -1;

  int currentFluxDuration = 30;
  int countdownSeconds = 0;
  int currentBreakDuration = 1;
  int currentLongBreakDuration = 0;
  int currentSessionCount = 4;

  void handleSession() {
    if (session == currentSessionCount * 2 - 1) {
      session = 0;
    } else {
      session++;
    }
    print(session);
    notifyListeners();
  }

  String sequenceHandler() {
    if ((session + 1) / 2 == currentSessionCount) {
      print("long break");
      return "long break";
    } else if (session % 2 == 0) {
      print("flux");
      return "flux";
    } else {
      print("break");
      return "break";
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
