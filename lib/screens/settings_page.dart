import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux/provider/settings_provider.dart';
import 'package:flux/screens/settings_screens/block_apps.dart';
import 'package:flux/screens/settings_screens/language.dart';
import 'package:flux/screens/settings_screens/sounds_notifications.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (_, notifier, __) => Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: SettingsList(
            sections: [
              SettingsSection(
                title: const Text('App'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(CupertinoIcons.globe),
                    title: const Text('Language'),
                    value: Text(notifier.selectedLanguage),
                    onPressed: (context) => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LanguageSettingsScreen(),
                      ),
                    ),
                  ),
                  SettingsTile.navigation(
                      leading: const Icon(CupertinoIcons.speaker_2),
                      title: const Text('Sounds & Notifications'),
                      onPressed: (context) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SoundsNotificationsPage(),
                            ),
                          )),
                  SettingsTile.switchTile(
                    onToggle: (value) {
                      notifier.setAutoStart(value);
                    },
                    initialValue: notifier.autoStartNextSession,
                    leading: const Icon(CupertinoIcons.arrow_2_circlepath),
                    title: const Text('Auto start next session'),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(CupertinoIcons.lock),
                    title: const Text('Block apps'),
                    onPressed: (context) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BlockAps(),
                        ),
                      );
                    },
                  ),
                  SettingsTile.switchTile(
                    initialValue: notifier.screenAlwaysOn,
                    onToggle: (value) {
                      notifier.handleScreenAlwaysOn();
                    },
                    leading: const Icon(CupertinoIcons.eye),
                    title: const Text('Screen always on'),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('User'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.login),
                    title: const Text('Log in'),
                  ),
                  SettingsTile.switchTile(
                    onToggle: (value) {},
                    initialValue: true,
                    leading: const Icon(Icons.sync),
                    title: const Text('Sync progress'),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(CupertinoIcons.refresh_bold,
                        color: Colors.red),
                    title: const Text('Reset stats',
                        style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
              SettingsSection(
                title: const Text('Other'),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: const Text('Website'),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: const Text('Twitter'),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: const Text('Privacy Policy'),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: const Text('Terms of Use'),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: const Text('Rate us!'),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
