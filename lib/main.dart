import 'package:flutter/material.dart';
import 'package:flux/notifier/flux_notifier..dart';
import 'package:flux/pages/mainpage.dart';
import 'package:flux/pages/settings.dart';
import 'package:flux/pages/stats.dart';
import 'package:flux/theme/dark_theme.dart';
import 'package:flux/theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => FluxNotifier(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: Scaffold(body: MainPage()),
    );
  }
}
