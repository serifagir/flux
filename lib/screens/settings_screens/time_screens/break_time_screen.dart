import 'package:flutter/material.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class BreakTimeScreen extends StatefulWidget {
  const BreakTimeScreen({super.key});

  @override
  State<BreakTimeScreen> createState() => _BreakTimeScreenState();
}

class _BreakTimeScreenState extends State<BreakTimeScreen> {
  @override
  Widget build(BuildContext context) {
    final fluxConfigureProvider = Provider.of<FluxConfigureProvider>(context);
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Set Break Duration'),
        ),
        body: SettingsList(sections: [
          SettingsSection(tiles: <SettingsTile>[
            SettingsTile(
              title: const Text('1 Minutes'),
              trailing: Icon(FluxConfigureProvider.breakDurationValue == 1
                  ? Icons.check
                  : null),
              onPressed: (context) {
                fluxConfigureProvider.updateBreakDurationValue(1);
                timerProvider.resetTimer();
              },
            ),
            SettingsTile(
              title: const Text('5 Minutes'),
              trailing: Icon(FluxConfigureProvider.breakDurationValue == 5
                  ? Icons.check
                  : null),
              onPressed: (context) {
                fluxConfigureProvider.updateBreakDurationValue(5);
                timerProvider.resetTimer();
              },
            ),
            SettingsTile(
              title: const Text('10 Minutes'),
              trailing: Icon(FluxConfigureProvider.breakDurationValue == 10
                  ? Icons.check
                  : null),
              onPressed: (context) {
                fluxConfigureProvider.updateBreakDurationValue(10);
                timerProvider.resetTimer();
              },
            ),
            SettingsTile(
              title: const Text('15 Minutes'),
              trailing: Icon(FluxConfigureProvider.breakDurationValue == 15
                  ? Icons.check
                  : null),
              onPressed: (context) {
                fluxConfigureProvider.updateBreakDurationValue(15);
                timerProvider.resetTimer();
              },
            ),
            SettingsTile(
              title: const Text('20 Minutes'),
              trailing: Icon(FluxConfigureProvider.breakDurationValue == 20
                  ? Icons.check
                  : null),
              onPressed: (context) {
                fluxConfigureProvider.updateBreakDurationValue(20);
                timerProvider.resetTimer();
              },
            ),
            SettingsTile(
              title: const Text('30 Minutes'),
              description: const Text('Duration of each break'),
              trailing: Icon(FluxConfigureProvider.breakDurationValue == 30
                  ? Icons.check
                  : null),
              onPressed: (context) {
                fluxConfigureProvider.updateBreakDurationValue(30);
                timerProvider.resetTimer();
              },
            ),
          ]),
        ]));
  }
}
