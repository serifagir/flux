import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/main_page_components/session_control_buttons.dart';
import 'package:flux/components/main_page_components/session_timer.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/samurai_mode_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:flux/screens/settings_page.dart';
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
        alignment: AlignmentDirectional.center,
        children: [
          SettingsPageNavigateButton(size: size, timerProvider: timerProvider),
          FluxConfigureDialogButton(size: size, timerProvider: timerProvider),
          StatsPageNavigateButton(size: size),
          CustomizePageNavigateButton(size: size),
          const SessionTimer(),
          const SessionControlButtons()
        ],
      )),
    );
  }
}

class FluxConfigureDialogButton extends StatelessWidget {
  const FluxConfigureDialogButton({
    super.key,
    required this.size,
    required this.timerProvider,
  });

  final Size size;
  final TimerProvider timerProvider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: size.width * 0.1,
        left: size.width * 0.13,
        child: timerProvider.isRunning
            ? const SizedBox()
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
                )));
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
        surfaceTintColor: Theme.of(context).colorScheme.background,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Configure Flux",
          style: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              softWrap: true,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              " ${timerProvider.currentTimeDisplay} $minText",
              softWrap: true,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  updateValue(15);
                  timerProvider.resetTimer();
                },
                child: Text("25")),
            ElevatedButton(
                onPressed: () {
                  updateValue(15);
                  timerProvider.resetTimer();
                },
                child: Text("40")),
            ElevatedButton(
                onPressed: () {
                  updateValue(15);
                  timerProvider.resetTimer();
                },
                child: Text("50")),
            ElevatedButton(
                onPressed: () {
                  updateValue(15);
                  timerProvider.resetTimer();
                },
                child: Text("15")),
          ],
        ),
      ],
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
                    "You can not close the app or turn off your phone. You can only receive calls and messages. "
                    "Are you sure you want to activate SAMURAI MODE?"),
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
              fontWeight: FontWeight.w400,
            ),
          ),
          Switch(
            activeColor: Colors.red,
            inactiveThumbColor: Theme.of(context).colorScheme.primary,
            value: samuraiModeProvider.isSamuraiMode,
            onChanged: (value) {
              samuraiModeProvider.toggleSamuraiMode();
            },
          )
        ],
      ),
    );
  }
}

class SettingsPageNavigateButton extends StatelessWidget {
  const SettingsPageNavigateButton({
    super.key,
    required this.size,
    required this.timerProvider,
  });

  final Size size;
  final TimerProvider timerProvider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: size.width * 0.1,
        left: size.width * 0.02,
        child: timerProvider.isRunning
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
                icon: const Icon(CupertinoIcons.gear_alt, size: 30)));
  }
}

class StatsPageNavigateButton extends StatelessWidget {
  const StatsPageNavigateButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: size.width * 0.1,
        right: size.width * 0.02,
        child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Text("null")));
            },
            icon: const Icon(CupertinoIcons.chart_bar_square, size: 30)));
  }
}

class CustomizePageNavigateButton extends StatelessWidget {
  const CustomizePageNavigateButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: size.width * 0.1,
        right: size.width * 0.13,
        child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const Text("customize page"));
            },
            icon: const Icon(
              CupertinoIcons.paintbrush,
              size: 30,
            )));
  }
}
