import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/components/main_page_components/session_control_buttons.dart';
import 'package:flux/components/main_page_components/session_timer.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Positioned(
              bottom: size.width * 0.1,
              left: size.width * 0.02,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.gear_alt, size: 30))),
          Positioned(
              bottom: size.width * 0.1,
              left: size.width * 0.13,
              child: IconButton(
                  onPressed: () {
                    fluxConfigureDialog(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.waveform,
                    size: 30,
                  ))),
          Positioned(
              bottom: size.width * 0.1,
              right: size.width * 0.02,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.chart_bar_square, size: 30))),
          Positioned(
              bottom: size.width * 0.1,
              right: size.width * 0.13,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.paintbrush,
                    size: 30,
                  ))),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SessionTimer()),
              SessionControlButtons(),
            ],
          ),
        ],
      )),
    );
  }

  Future<dynamic> fluxConfigureDialog(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fluxConfigureProvider =
        Provider.of<FluxConfigureProvider>(context, listen: false);
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: const Text("Configure Flux"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DurationWidget(
                  title: 'flux duration',
                  sliderValue: FluxConfigureProvider.fluxDurationValue,
                  max: 60,
                  min: 15,
                  updateValue: (newValue) {
                    fluxConfigureProvider.updateFluxDurationValue(newValue);
                  },
                  minText: 'min',
                ),
                DurationWidget(
                  title: 'break duration',
                  sliderValue: FluxConfigureProvider.breakDurationValue,
                  max: 20,
                  min: 5,
                  updateValue: (newValue) {
                    fluxConfigureProvider.updateBreakDurationValue(newValue);
                  },
                  minText: 'min',
                ),
                DurationWidget(
                  title: 'long break duration',
                  sliderValue: FluxConfigureProvider.longBreakDurationValue,
                  max: 30,
                  min: 10,
                  updateValue: (newValue) {
                    fluxConfigureProvider
                        .updateLongBreakDurationValue(newValue);
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
                SamuraiModeForm()
              ],
            )));
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
        TextWithPadding(text: "$sliderValue $minText"),
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
    return Row(
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
          value: true,
          onChanged: (value) {},
        )
      ],
    );
  }
}
