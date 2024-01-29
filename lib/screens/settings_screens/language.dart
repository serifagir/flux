import 'package:flutter/material.dart';
import 'package:flux/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageSettingsScreen extends StatefulWidget {
  const LanguageSettingsScreen({super.key});

  @override
  State<LanguageSettingsScreen> createState() => _LanguageSettingsScreenState();
}

class _LanguageSettingsScreenState extends State<LanguageSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (_, notifier, __) => Scaffold(
          appBar: AppBar(
            title: const Text('Language'),
          ),
          body: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        notifier.setLanguage(notifier.languages[index]);
                        Navigator.pop(context);
                      });
                    },
                    child: ListTile(
                      title: Text(notifier.languages[index]),
                      trailing:
                          notifier.languages[index] == notifier.selectedLanguage
                              ? const Icon(Icons.check)
                              : null,
                    ),
                  ),
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: notifier.languages.length)),
    );
  }
}
