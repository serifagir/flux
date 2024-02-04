import 'package:flutter/material.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/samurai_mode_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionTimer extends StatelessWidget {
  const SessionTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TimeModeWidget(),
          SessionCountIndicator(),
          TimeWidget(),
        ],
      ),
    );
  }
}

class TimeModeWidget extends StatelessWidget {
  const TimeModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    final samuraiModeProvider = Provider.of<SamuraiModeProvider>(context);
    return Text(timerProvider.isBreakTime ? 'break' : 'flux',
        style: GoogleFonts.poppins(
          color: samuraiModeProvider.isSamuraiMode
              ? Colors.red
              : Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ));
  }
}

class SessionCountIndicator extends StatelessWidget {
  const SessionCountIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    final samuraiModeProvider = Provider.of<SamuraiModeProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          FluxConfigureProvider.sessionCountValue,
          (index) => samuraiModeProvider.isSamuraiMode
              ? Icon(
                  (index <
                          int.parse(timerProvider.currentRoundDisplay
                                  .split("/")[0]) -
                              1)
                      ? Icons.water_drop
                      : (index <
                              (int.parse(timerProvider.currentRoundDisplay
                                  .split("/")[0])))
                          ? Icons.water_drop
                          : Icons.water_drop_outlined,
                  color: Colors.red,
                )
              : Container(
                  margin: EdgeInsets.all(5.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.0,
                    ),
                    color: (index <
                            int.parse(timerProvider.currentRoundDisplay
                                    .split("/")[0]) -
                                1)
                        ? Theme.of(context).colorScheme.primary
                        : index <
                                (int.parse(timerProvider.currentRoundDisplay
                                    .split("/")[0]))
                            ? Theme.of(context).colorScheme.primary
                            : Colors
                                .transparent, // replace with your desired colo
                    shape: BoxShape.circle,
                  ),
                ),
        ));
  }
}

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    final samuraiModeProvider = Provider.of<SamuraiModeProvider>(context);
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        timerProvider.currentTimeDisplay,
        style: GoogleFonts.nanumGothic(
          color: samuraiModeProvider.isSamuraiMode
              ? Colors.red
              : Theme.of(context).colorScheme.primary,
          fontSize: 100,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
