import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';
import 'package:flux/provider/auto_start_provider.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/stats_provider.dart';
import 'package:provider/provider.dart';

class TimerProvider extends ChangeNotifier {
  // final SoundSelectionProvider _audioProvider = SoundSelectionProvider();

  final statsProvider = StatsProvider();

  late Timer _timer;
  static int _currentSession = 1;

  late int _currentTimeInSeconds;

  bool _isRunning = false;
  bool _isBreakTime = false;

  TimerProvider() {
    resetTimer();
  }

  static int get currentSession => _currentSession;

  bool get isRunning => _isRunning;
  bool get isBreakTime => _isBreakTime;
  int get currentTimeInSeconds => _currentTimeInSeconds;

  int get maxTimeInSeconds =>
      (_isBreakTime
          ? (_currentSession == FluxConfigureProvider.sessionCountValue
              ? FluxConfigureProvider.longBreakDurationValue
              : FluxConfigureProvider.breakDurationValue)
          : FluxConfigureProvider.fluxDurationValue) *
      60;

  bool get isEqual => currentTimeInSeconds == maxTimeInSeconds;

  String get currentTimeDisplay {
    int minutes = _currentTimeInSeconds ~/ 60;
    int seconds = _currentTimeInSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  String get currentRoundDisplay {
    return "$_currentSession/${FluxConfigureProvider.sessionCountValue}";
  }

  void toggleTimer() {
    if (!_isRunning) {
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
      notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void jumpNextRound() {
    if (_isRunning) {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }

    _timeControl();

    if (AutoStartProvider.autoStart == false) {
      _timer.cancel();
      _isRunning = false;
      notifyListeners();
    }
  }

  void _timeControl() {
    if (_isBreakTime) {
      _currentTimeInSeconds = FluxConfigureProvider.fluxDurationValue * 60;
      _addRound();
    } else {
      if (_currentSession == FluxConfigureProvider.sessionCountValue) {
        _currentTimeInSeconds =
            FluxConfigureProvider.longBreakDurationValue * 60;
      } else {
        _currentTimeInSeconds = FluxConfigureProvider.breakDurationValue * 60;
      }
    }
    _isBreakTime = !_isBreakTime;
    toggleTimer();
  }

  void _updateTimer(Timer timer) {
    if (_currentTimeInSeconds > 0) {
      _currentTimeInSeconds--;
      notifyListeners();
    } else {
      _timer.cancel();
      _isRunning = false;

      if (!_isBreakTime) {
        statsProvider.addCompletedFlux(
          Flux(
              fluxDuration: FluxConfigureProvider.fluxDurationValue,
              date: DateTime.now()),
        );
      }

      _timeControl();

      if (AutoStartProvider.autoStart == false) {
        _timer.cancel();
        _isRunning = false;
        notifyListeners();
      }

      // if (NotificationProvider.isActive) {
      //   _audioProvider.playSelectedAudio();
      // }
    }
  }

  void _addRound() {
    _currentSession < FluxConfigureProvider.sessionCountValue
        ? _currentSession++
        : _currentSession = 1;
  }

  void resetTimer() {
    _currentTimeInSeconds = maxTimeInSeconds;
    notifyListeners();
  }
}
