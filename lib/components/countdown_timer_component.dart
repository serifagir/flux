import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:google_fonts/google_fonts.dart';
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
    if (widget.notifier.isTimerRunning) {
      return Center(
        child: Countdown(
          controller: widget.countdownController,
          seconds: widget.countdownSeconds,
          build: (BuildContext context, double time) {
            String timerValue =
                '${((time - 1) ~/ 60).toString().padLeft(2, '0')}:${((time) % 60).toStringAsFixed(0).padLeft(2, '0')}';
            return Text(
              timerValue,
              textAlign: TextAlign.center,
              softWrap: false,
              style: GoogleFonts.poppins(
                  fontSize: 100,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            );
          },
          interval: Duration(milliseconds: 100),
          onFinished: () {
            print('Timer is done!');
            widget.notifier.addCompletedFlux(widget.countdownSeconds);
            print(widget.notifier.completedFluxes);
            setState(() {
              widget.notifier.isTimerRunning = false;
              widget.notifier.isBreakRunning = true;
            });
          },
        ),
      );
    } else {
      return Text(
          '${(widget.countdownSeconds ~/ 60).toString().padLeft(2, '0')}:${(widget.countdownSeconds % 60).toStringAsFixed(0).padLeft(2, '0')}',
          style: GoogleFonts.poppins(
              fontSize: 100,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.primary));
    }
  }
}
