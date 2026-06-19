import 'package:flutter/material.dart';
import 'themes/theme.dart';

/// The `ThemeProvider` class provides a way to manage the application's theme.
///
/// It extends `ChangeNotifier`, meaning it can notify its listeners when the theme changes.
///
/// The class provides a `themeData` getter to get the current theme, and a `setDarkMode` method to change the theme.
///
/// The `setDarkMode` method takes a boolean `darkMode` as a parameter. If `darkMode` is true, it sets the theme to dark, otherwise it sets the theme to light. After changing the theme, it notifies its listeners.
class ThemeProvider with ChangeNotifier {
  MaterialTheme materialTheme = MaterialTheme(ThemeData.light().textTheme);
  ThemeData dark = MaterialTheme(ThemeData.light().textTheme).dark();
  ThemeData light = MaterialTheme(ThemeData.light().textTheme).light();
  final ThemeData _themeData = MaterialTheme(
    ThemeData.light().textTheme,
  ).dark();

  ThemeData get themeData => _themeData;
}
