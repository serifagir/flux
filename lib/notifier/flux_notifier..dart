import 'package:flutter/material.dart';

class FluxNotifier with ChangeNotifier {
  bool isTimerRunning = false;
  bool isTimerPaused = false;
}
