import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class CountdownTimerComponent extends StatefulWidget {
  final FluxNotifier notifier;
  final CountdownController countdownController;
  final int countdownSeconds;

  const CountdownTimerComponent(
      {super.key,
      required this.notifier,
      required this.countdownController,
      required this.countdownSeconds});

  @override
  State<CountdownTimerComponent> createState() =>
      _CountdownTimerComponentState();
}

class _CountdownTimerComponentState extends State<CountdownTimerComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FluxNotifier>(
      builder: (context, pomodoroTimerProvider, child) {
        return Column(
          children: [
            Text(
              '${pomodoroTimerProvider.minutesRemaining} : ${pomodoroTimerProvider.secondsRemaining.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              pomodoroTimerProvider.isWorking ? 'Work' : 'Break',
              style: TextStyle(fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
