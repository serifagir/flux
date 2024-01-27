import 'package:flutter/material.dart';
import 'package:flux/provider/auto_start_provider.dart';
import 'package:flux/provider/flux_configure_provider.dart';
import 'package:flux/provider/time_provider.dart';
import 'package:flux/screens/main_page.dart';
import 'package:flux/theme/dark_theme.dart';
import 'package:flux/theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final timerProvider = TimerProvider();
  final autoStartProvider = AutoStartProvider();
  final fluxConfigureProvider = FluxConfigureProvider();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: timerProvider),
      ChangeNotifierProvider.value(value: autoStartProvider),
      ChangeNotifierProvider.value(value: fluxConfigureProvider),
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
      home: const Scaffold(body: MainPage()),
    );
  }
}
