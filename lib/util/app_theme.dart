import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightBackgroundColor = Colors.white;
  static const Color _lightOnBackgroundColor = Colors.black;
  static const Color _lightPrimaryColor = Color(0xFF00B6C8);
  static const Color _lightErrorColor = Color(0xFFFA2323);
  static const Color _lightSurfaceColor = Color(0xFFE2E2E2);
  static const Color _lightOnSurfaceColor = Color(0xFF888AA0);
  static const Color _lightSecondaryColor = Color(0xFF039D38);
  static const Color _lightOnSecondaryColor = Color(0xFFFFC33D);
  static const Color _lightOnPrimaryColor = Colors.white;

  static const Color _darkBackgroundColor = Color(0xFF303030);
  static const Color _darkOnBackgroundColor = Colors.white;
  static const Color _darkPrimaryColor = Color(0xFFFFC33D);
  static const Color _darkErrorColor = Color(0xFFFA2323);
  static const Color _darkSurfaceColor = Color(0xFF888AA0);
  static const Color _darkOnSurfaceColor = Color(0xFFE2E2E2);
  static const Color _darkSecondaryColor = Color(0xFF039D38);
  static const Color _darkOnSecondaryColor = Color(0xFFFFC33D);
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightBackgroundColor,
      colorScheme: const ColorScheme.light(
        background: _lightBackgroundColor,
        onBackground: _lightOnBackgroundColor,
        primary: _lightPrimaryColor,
        error: _lightErrorColor,
        surface: _lightSurfaceColor,
        onSurface: _lightOnSurfaceColor,
        secondary: _lightSecondaryColor,
        onSecondary: _lightOnSecondaryColor,
        onPrimary: _lightOnPrimaryColor,
      ),
      dividerTheme: const DividerThemeData(color: Colors.black12));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkBackgroundColor,
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        onBackground: _darkOnBackgroundColor,
        error: _darkErrorColor,
        secondary: _darkSecondaryColor,
        onSecondary: _darkOnSecondaryColor,
        surface: _darkSurfaceColor,
        onSurface: _darkOnSurfaceColor,
        onPrimary: _darkOnPrimaryColor,
        background: _darkBackgroundColor,
      ),
      dividerTheme: const DividerThemeData(color: Colors.black));
}

getColorwithOpacity(Color color, double opacity) {
  color = color.withOpacity(opacity);
  return color;
}
