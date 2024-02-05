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
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (!timerProvider.isEqual) {
                timerProvider.resetTimer();
                timerProvider.toggleTimer();
              }
            },
            icon: Icon(Icons.replay, size: 30.0),
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
            icon: Icon(timerProvider.isBreakTime ? Icons.fast_forward : null,
                size: 30.0),
          ),
        ],
      ),
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
