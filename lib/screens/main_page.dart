import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/main_page_components/session_control_buttons.dart';
import 'package:flux/components/main_page_components/session_timer.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/samurai_mode_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:flux/screens/customize_page.dart';
import 'package:flux/screens/settings_page.dart';
import 'package:flux/screens/stats_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Positioned(
              bottom: size.width * 0.1,
              left: size.width * 0.02,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPage()));
                  },
                  icon: Icon(CupertinoIcons.gear_alt, size: 30))),
          Positioned(
              bottom: size.width * 0.1,
              left: size.width * 0.13,
              child: timerProvider.isRunning
                  ? SizedBox()
                  : IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => FluxConfigureDialog(
                                fluxConfigureProvider:
                                    Provider.of<FluxConfigureProvider>(context,
                                        listen: false)));
                      },
                      icon: const Icon(
                        CupertinoIcons.waveform,
                        size: 30,
                      ))),
          Positioned(
              bottom: size.width * 0.1,
              right: size.width * 0.02,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StatsPage()));
                  },
                  icon: const Icon(CupertinoIcons.chart_bar_square, size: 30))),
          Positioned(
              bottom: size.width * 0.1,
              right: size.width * 0.13,
              child: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => CustomizePage());
                  },
                  icon: const Icon(
                    CupertinoIcons.paintbrush,
                    size: 30,
                  ))),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SessionTimer(),
              SessionControlButtons(),
            ],
          ),
        ],
      )),
    );
  }
}

class FluxConfigureDialog extends StatelessWidget {
  const FluxConfigureDialog({
    super.key,
    required this.fluxConfigureProvider,
  });

  final FluxConfigureProvider fluxConfigureProvider;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Configure Flux"),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DurationWidget(
              title: 'flux duration',
              sliderValue: FluxConfigureProvider.fluxDurationValue,
              max: 60,
              min: 1,
              updateValue: (newValue) {
                fluxConfigureProvider.updateFluxDurationValue(newValue);
              },
              minText: 'min',
            ),
            DurationWidget(
              title: 'break duration',
              sliderValue: FluxConfigureProvider.breakDurationValue,
              max: 20,
              min: 1,
              updateValue: (newValue) {
                fluxConfigureProvider.updateBreakDurationValue(newValue);
              },
              minText: 'min',
            ),
            DurationWidget(
              title: 'long break duration',
              sliderValue: FluxConfigureProvider.longBreakDurationValue,
              max: 30,
              min: 1,
              updateValue: (newValue) {
                fluxConfigureProvider.updateLongBreakDurationValue(newValue);
              },
              minText: 'min',
            ),
            DurationWidget(
              title: 'session count',
              sliderValue: FluxConfigureProvider.sessionCountValue,
              max: 4,
              min: 2,
              updateValue: (newValue) {
                fluxConfigureProvider.updateSessionCountValue(newValue);
              },
              minText: '',
            ),
            const SamuraiModeForm(),
            SizedBox(height: size.height * 0.02),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text("Want longer durations? Tap to upgrade to premium!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          )),
                ),
              ),
            ),
          ],
        ));
  }
}

class DurationWidget extends StatelessWidget {
  DurationWidget({
    super.key,
    required this.title,
    required this.sliderValue,
    required this.max,
    required this.min,
    required this.updateValue,
    required this.minText,
  });
  final String title;
  final double max;
  final double min;
  int sliderValue;
  String minText;
  void Function(int newValue) updateValue;

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Slider(
              label: "$sliderValue",
              max: max,
              min: min,
              value: sliderValue.toDouble(),
              onChanged: (value) {
                sliderValue = value.toInt();
                updateValue(sliderValue);
                timerProvider.resetTimer();
              },
            ),
          ],
        ),
        SizedBox(
          width: 50,
          child: Text(
            "$sliderValue min",
          ),
        ),
      ],
    );
  }
}

class TextWithPadding extends StatelessWidget {
  const TextWithPadding({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class SamuraiModeForm extends StatelessWidget {
  const SamuraiModeForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final samuraiModeProvider = Provider.of<SamuraiModeProvider>(context);
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("Samurai Mode"),
                content: const Text(
                    "Samurai Mode is a mode that will make you focus on your work. "
                    "When you activate this mode, you will not be able to stop the timer until the timer is finished. "
                    "If you stop the timer, you will be punished by having to wait 5 minutes to start the timer again. "
                    "Are you sure you want to activate this mode?"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        samuraiModeProvider.toggleSamuraiMode();
                      },
                      child: Text(samuraiModeProvider.isSamuraiMode
                          ? "Deactivate"
                          : "Activate")),
                ],
              )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Samurai Mode",
            style: GoogleFonts.poppins(
              color: Colors.red,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            activeColor: Colors.red,
            inactiveTrackColor: Colors.grey,
            inactiveThumbColor: Theme.of(context).colorScheme.primary,
            value: samuraiModeProvider.isSamuraiMode,
            onChanged: (value) {
              samuraiModeProvider.toggleSamuraiMode();
              print(samuraiModeProvider.isSamuraiMode);
            },
          )
        ],
      ),
    );
  }
}
