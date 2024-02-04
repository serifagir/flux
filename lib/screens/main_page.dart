import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/main_page_components/session_control_buttons.dart';
import 'package:flux/components/main_page_components/session_timer.dart';
import 'package:flux/models/flux.dart';
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
    final fluxConfigureProvider = Provider.of<FluxConfigureProvider>(context);
    return Scaffold(
      body: Center(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SettingsPageNavigateButton(size: size, timerProvider: timerProvider),
          FluxConfigureDialogButton(
            size: size,
            timerProvider: timerProvider,
            fluxConfigureProvider: fluxConfigureProvider,
          ),
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
  const FluxConfigureDialogButton(
      {super.key,
      required this.size,
      required this.timerProvider,
      required this.fluxConfigureProvider});

  final Size size;
  final TimerProvider timerProvider;
  final FluxConfigureProvider fluxConfigureProvider;

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
                      builder: (context) => FluxConfigureDialog());
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
  });

  @override
  Widget build(BuildContext context) {
    final fluxConfigureProvider = Provider.of<FluxConfigureProvider>(context);
    return Column(
      children: [
        DurationWidget(
          title: 'Study Duration',
          sliderValue: FluxConfigureProvider.fluxDurationValue,
          max: 60,
          min: 5,
          updateValue: (newValue) {
            fluxConfigureProvider.updateFluxDurationValue(newValue);
          },
          minText: 'min',
        ),
        DurationWidget(
          title: 'Short break duration',
          sliderValue: FluxConfigureProvider.breakDurationValue,
          max: 30,
          min: 1,
          updateValue: (newValue) {
            fluxConfigureProvider.updateBreakDurationValue(newValue);
          },
          minText: 'min',
        ),
        DurationWidget(
          title: 'Long break duration',
          sliderValue: FluxConfigureProvider.longBreakDurationValue,
          max: 45,
          min: 1,
          updateValue: (newValue) {
            fluxConfigureProvider.updateLongBreakDurationValue(newValue);
          },
          minText: 'min',
        ),
        DurationWidget(
          title: 'Sessions',
          sliderValue: FluxConfigureProvider.sessionCountValue,
          max: 15,
          min: 2,
          updateValue: (newValue) {
            fluxConfigureProvider.updateSessionCountValue(newValue);
          },
          minText: '',
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
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
        SizedBox(
          height: 70,
          child: Stack(
            children: [
              TextWithPadding(text: title),
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
              Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text('${min.toInt()} $minText')),
              Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Text('${max.toInt()} $minText')),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
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
