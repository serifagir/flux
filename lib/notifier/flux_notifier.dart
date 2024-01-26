import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';

enum TimerType { flux, breakTime, longBreakTime }

class FluxNotifier with ChangeNotifier {
// ----------------- Flux Sequence Settings ----------------- \\
  int countdownSeconds = 0;

  int fluxDurationInMinutes = 15;
  int breakDurationInMinutes = 1;
  int longBreakDurationInMinutes = 15;
  int sessionCount = 4;

  TimerType _currentTimer = TimerType.flux;
  int _sessionsCompleted = 0;

  bool get isWorking => _currentTimer == TimerType.flux;

  int get minutesRemaining {
    switch (_currentTimer) {
      case TimerType.flux:
        return fluxDurationInMinutes;
      case TimerType.breakTime:
        return breakDurationInMinutes;
      case TimerType.longBreakTime:
        return longBreakDurationInMinutes;
      default:
        return 0;
    }
  }

  int secondsRemaining = 0;
  late Timer _timer;

  void startTimer() {
    int totalSeconds = minutesRemaining * 60;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      totalSeconds--;
      secondsRemaining = totalSeconds % 60;

      if (totalSeconds <= 0) {
        _timer.cancel();
        _handleTimerCompletion();
      }
      notifyListeners();
    });
  }

  void _handleTimerCompletion() {
    if (_currentTimer == TimerType.flux) {
      _sessionsCompleted++;

      if (_sessionsCompleted % sessionCount == 0) {
        _currentTimer = TimerType.longBreakTime;
      } else {
        _currentTimer = TimerType.breakTime;
      }
    } else {
      _currentTimer = TimerType.flux;
    }
    secondsRemaining = 0;
    startTimer();
  }

  void pauseTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    notifyListeners();
  }

  void resetTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    _currentTimer = TimerType.flux;
    secondsRemaining = 0;
    notifyListeners();
  }

  void startNextTimer() {
    _handleTimerCompletion();
    startTimer();
    notifyListeners();
  }

  void setWorkDuration(int minutes) {
    fluxDurationInMinutes = minutes;
    notifyListeners();
  }

  void setBreakDuration(int minutes) {
    breakDurationInMinutes = minutes;
    notifyListeners();
  }

  void setLongBreakDuration(int minutes) {
    longBreakDurationInMinutes = minutes;
    notifyListeners();
  }

  void setSessionCount(int count) {
    sessionCount = count;
    notifyListeners();
  }

// ----------------- Flux Analytics Settings ----------------- \\
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
