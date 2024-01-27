import 'package:flutter/material.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SessionTimer extends StatelessWidget {
  const SessionTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeModeWidget(),
        SessionCountIndicator(),
        TimeWidget(),
      ],
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
    return Text(timerProvider.isBreakTime ? 'break' : 'flux',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ));
  }
}

class SessionCountIndicator extends StatefulWidget {
  const SessionCountIndicator({super.key});

  @override
  State<SessionCountIndicator> createState() => _SessionCountIndicatorState();
}

class _SessionCountIndicatorState extends State<SessionCountIndicator> {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          FluxConfigureProvider.sessionCountValue,
          (index) => Container(
            margin: EdgeInsets.all(5.0),
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              color: (index <
                      int.parse(
                              timerProvider.currentRoundDisplay.split("/")[0]) -
                          1)
                  ? Colors.white
                  : index <
                          (int.parse(
                              timerProvider.currentRoundDisplay.split("/")[0]))
                      ? Colors.red
                      : Colors.transparent, // replace with your desired colo
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
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Text(
        timerProvider.currentTimeDisplay,
        style: GoogleFonts.nanumGothic(
          fontSize: 100,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
