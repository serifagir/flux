import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:timer_count_down/timer_controller.dart';

class CountdownTimerControllerButton extends StatefulWidget {
  final FluxNotifier notifier;
  final CountdownController countdownController;

  const CountdownTimerControllerButton({
    super.key,
    required this.notifier,
    required this.countdownController,
  });

  @override
  State<CountdownTimerControllerButton> createState() =>
      _CountdownTimerControllerButtonState();
}

class _CountdownTimerControllerButtonState
    extends State<CountdownTimerControllerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          widget.notifier.isTimerRunning
              ? widget.notifier.isTimerPaused
                  ? CupertinoIcons.play_arrow
                  : CupertinoIcons.pause
              : CupertinoIcons.play_arrow,
          size: 40,
        ),
        onPressed: () {});
  }
}
