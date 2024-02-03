import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/provider/flux_configure_provider.dart';
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
      bottom: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              if (!timerProvider.isEqual) {
                timerProvider.resetTimer();
              }
              if (!timerProvider.isRunning) {
                timerProvider.resetCurrentSession();
              }
            },
            icon: Icon(
                timerProvider.isRunning ? null : CupertinoIcons.refresh_thick,
                size: 30.0),
          ),
          SizedBox(
            width: size.width * 0.1,
          ),
          IconButton(
            onPressed: () {
              timerProvider.toggleTimer();
            },
            icon: Icon(
              timerProvider.isRunning
                  ? CupertinoIcons.pause_fill
                  : CupertinoIcons.play_fill,
              size: 50.0,
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
          ),
          IconButton(
            onPressed: () {
              timerProvider.jumpNextRound();
            },
            icon: Icon(
                timerProvider.isBreakTime ? CupertinoIcons.forward : null,
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
