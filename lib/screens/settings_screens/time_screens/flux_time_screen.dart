import 'package:flutter/material.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class FluxTimeScreen extends StatefulWidget {
  const FluxTimeScreen({super.key});

  @override
  State<FluxTimeScreen> createState() => _FluxTimeScreenState();
}

class _FluxTimeScreenState extends State<FluxTimeScreen> {
  @override
  Widget build(BuildContext context) {
    final fluxConfigureProvider = Provider.of<FluxConfigureProvider>(context);
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('set flux time'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile(
                  title: const Text('1 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 1
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(1);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('25 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 25
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(25);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('30 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 30
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(30);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('35 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 35
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(35);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('40 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 40
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(40);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('45 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 45
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(45);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('50 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 50
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(50);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('60 Minutes'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 60
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(60);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('90 Minutes'),
                  description: const Text('Duration of each flux'),
                  trailing: Icon(FluxConfigureProvider.fluxDurationValue == 90
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateFluxDurationValue(90);
                    timerProvider.resetTimer();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
