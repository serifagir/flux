import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:provider/provider.dart';

class CountdownControllerButton extends StatefulWidget {
  const CountdownControllerButton({super.key});

  @override
  State<CountdownControllerButton> createState() =>
      _CountdownControllerButtonState();
}

class _CountdownControllerButtonState extends State<CountdownControllerButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FluxNotifier>(
      builder: (_, notifier, __) => IconButton(
        icon: Icon(
          notifier.isTimerRunning
              ? CupertinoIcons.pause
              : CupertinoIcons.play_arrow,
          size: 40,
        ),
        onPressed: () {
          if (notifier.isTimerRunning) {
            notifier.isTimerRunning = false;
            notifier.isTimerPaused = true;
          } else {
            notifier.isTimerRunning = true;
            notifier.isTimerPaused = false;
          }
        },
      ),
    );
  }
}
