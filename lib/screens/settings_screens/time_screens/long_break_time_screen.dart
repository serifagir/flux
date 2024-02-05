import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class LongBreakTimeScreen extends StatefulWidget {
  const LongBreakTimeScreen({super.key});

  @override
  State<LongBreakTimeScreen> createState() => _LongBreakTimeScreenState();
}

class _LongBreakTimeScreenState extends State<LongBreakTimeScreen> {
  @override
  Widget build(BuildContext context) {
    final fluxConfigureProvider = Provider.of<FluxConfigureProvider>(context);
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Set Long Break Time'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile(
                  title: const Text('1 Minutes'),
                  trailing: Icon(
                      FluxConfigureProvider.longBreakDurationValue == 1
                          ? Icons.check
                          : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateLongBreakDurationValue(1);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('15 Minutes'),
                  trailing: Icon(
                      FluxConfigureProvider.longBreakDurationValue == 15
                          ? Icons.check
                          : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateLongBreakDurationValue(15);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('20 Minutes'),
                  trailing: Icon(
                      FluxConfigureProvider.longBreakDurationValue == 20
                          ? Icons.check
                          : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateLongBreakDurationValue(20);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('30 Minutes'),
                  trailing: Icon(
                      FluxConfigureProvider.longBreakDurationValue == 30
                          ? Icons.check
                          : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateLongBreakDurationValue(30);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('45 Minutes'),
                  trailing: Icon(
                      FluxConfigureProvider.longBreakDurationValue == 45
                          ? Icons.check
                          : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateLongBreakDurationValue(45);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('60 Minutes'),
                  description: const Text('Duration of each long break'),
                  trailing: Icon(
                      FluxConfigureProvider.longBreakDurationValue == 60
                          ? Icons.check
                          : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateLongBreakDurationValue(60);
                    timerProvider.resetTimer();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
