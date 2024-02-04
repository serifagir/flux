import 'package:flutter/material.dart';

class LightThemeColors {
  static final background = Color(Colors.white.value);
  static final primary = Color(Colors.black.value);
  static final secondary = Color(Colors.grey.value);
  static final accent = Color(Colors.blue.value);
}

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: LightThemeColors.primary,
    secondary: LightThemeColors.secondary,
    background: LightThemeColors.background,
    surface: LightThemeColors.background,
    onPrimary: LightThemeColors.background,
    onSecondary: LightThemeColors.background,
    onBackground: LightThemeColors.primary,
    onSurface: LightThemeColors.primary,
    onError: LightThemeColors.background,
    brightness: Brightness.light,
  ),
);
