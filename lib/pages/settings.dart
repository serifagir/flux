import 'package:flutter/material.dart';
import 'package:flux/pages/block_apps.dart';
import 'package:flux/pages/sounds.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: [
          //----------------------------------- App Settings -----------------------------------//
          SettingsSection(
            title: Text('App'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Block Apps'),
                onPressed: (context) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const BlockAppsPage()));
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Sounds'),
                onPressed: (context) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const SoundsPage()));
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Week starts on Monday'),
              ),
            ],
          ),
          //----------------------------------- User Settings -----------------------------------//
          SettingsSection(
            title: Text('User'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Login'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
          //----------------------------------- Other Settings -----------------------------------//
          SettingsSection(
            title: Text('Other'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Privacy Policy'),
                value: Text('English'),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
