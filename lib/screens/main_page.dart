import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flux/components/main_page_components/session_control_buttons.dart';
import 'package:flux/components/main_page_components/session_timer.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:flux/screens/settings_page.dart';
import 'package:flux/screens/stats_page.dart';
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
          StatsPageNavigateButton(size: size),
          // CustomizePageNavigateButton(size: size),
          const SessionTimer(),
          const SessionControlButtons()
        ],
      )),
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
                  MaterialPageRoute(builder: (context) => const StatsPage()));
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
