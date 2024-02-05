import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/models/flux.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SessionCountScreen extends StatefulWidget {
  const SessionCountScreen({super.key});

  @override
  State<SessionCountScreen> createState() => _SessionCountScreenState();
}

class _SessionCountScreenState extends State<SessionCountScreen> {
  @override
  Widget build(BuildContext context) {
    final fluxConfigureProvider = Provider.of<FluxConfigureProvider>(context);
    final timerProvider = Provider.of<TimerProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Session Count'),
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              tiles: <SettingsTile>[
                SettingsTile(
                  title: const Text('2 Sessions'),
                  trailing: Icon(FluxConfigureProvider.sessionCountValue == 2
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateSessionCountValue(2);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('3 Sessions'),
                  trailing: Icon(FluxConfigureProvider.sessionCountValue == 3
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateSessionCountValue(3);
                    timerProvider.resetTimer();
                  },
                ),
                SettingsTile(
                  title: const Text('4 Sessions'),
                  description:
                      const Text('Number of sessions before long break'),
                  trailing: Icon(FluxConfigureProvider.sessionCountValue == 4
                      ? Icons.check
                      : null),
                  onPressed: (context) {
                    fluxConfigureProvider.updateSessionCountValue(4);
                    timerProvider.resetTimer();
                  },
                ),
              ],
            ),
          ],
        ));
  }
}
