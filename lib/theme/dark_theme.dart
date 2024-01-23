import 'package:flutter/material.dart';

class DarkThemeColors {
  static final background = Color(Colors.black.value);
  static final primary = Color(Colors.white.value);
  static final secondary = Color(Colors.grey.value);
  static final accent = Color(Colors.blue.value);
}

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: DarkThemeColors.primary,
    secondary: DarkThemeColors.secondary,
    background: DarkThemeColors.background,
    surface: DarkThemeColors.background,
    onPrimary: DarkThemeColors.background,
    onSecondary: DarkThemeColors.background,
    onBackground: DarkThemeColors.primary,
    onSurface: DarkThemeColors.primary,
    onError: DarkThemeColors.background,
    brightness: Brightness.dark,
  ),
);
