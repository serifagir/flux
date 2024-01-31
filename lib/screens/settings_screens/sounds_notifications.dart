import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SoundsNotificationsPage extends StatelessWidget {
  const SoundsNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sounds & Notifications'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(tiles: [
            SettingsTile.switchTile(
              initialValue: false,
              onToggle: (value) {},
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('All sounds'),
            ),
            SettingsTile.switchTile(
              initialValue: false,
              onToggle: (value) {},
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('Ticking sound'),
            ),
            SettingsTile.switchTile(
              initialValue: false,
              onToggle: (value) {},
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('Ambient sounds'),
            ),
            SettingsTile.switchTile(
              initialValue: false,
              onToggle: (value) {},
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('Session end sound'),
            ),
            SettingsTile.switchTile(
              initialValue: false,
              onToggle: (value) {},
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('Vibration'),
            ),
          ]),
        ],
      ),
    );
  }
}
