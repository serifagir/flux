import 'package:flutter/material.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:provider/provider.dart';

class SessionControlButtons extends StatelessWidget {
  const SessionControlButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: timerProvider.isEqual ? null : timerProvider.resetTimer,
          icon: const Icon(Icons.replay, size: 30.0),
        ),
        IconButton(
          onPressed: () {
            timerProvider.toggleTimer();
          },
          icon: Icon(
            timerProvider.isRunning ? Icons.pause : Icons.play_arrow,
            size: 40.0,
          ),
        ),
        IconButton(
          onPressed: () {
            timerProvider.jumpNextRound();
          },
          icon: const Icon(Icons.fast_forward, size: 30.0),
        ),
      ],
    );
  }
}

class RoundsWidget extends StatelessWidget {
  const RoundsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Text(
      timerProvider.currentRoundDisplay,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
