import 'package:flutter/material.dart';
import 'package:flux/provider/auto_start_provider.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/samurai_mode_provider.dart';
import 'package:flux/provider/settings_provider.dart';
import 'package:flux/provider/stats_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:flux/screens/main_page.dart';
import 'package:flux/theme/dark_theme.dart';
import 'package:flux/theme/light_theme.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final autoStartProvider = AutoStartProvider();
  final samuraiModeProvider = SamuraiModeProvider();
  final statsProvider = StatsProvider();
  final settingsProvider = SettingsProvider();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => FluxConfigureProvider()),
      ChangeNotifierProvider(create: (context) => TimerProvider()),
      ChangeNotifierProvider.value(value: settingsProvider),
      ChangeNotifierProvider.value(value: statsProvider),
      ChangeNotifierProvider.value(value: samuraiModeProvider),
      ChangeNotifierProvider.value(value: autoStartProvider),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(
          body: FutureBuilder(
        future: Provider.of<FluxConfigureProvider>(context, listen: false)
            .loadValueFromSharedPreferences(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.error != null) {
              return const Center(child: Text('An error occurred!'));
            } else {
              return const MainPage();
            }
          }
        },
      )),
    );
  }
}
