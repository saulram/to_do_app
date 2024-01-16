import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

///
/// This is an extension for the context to get the current theme data
/// by simply calling:
/// context.themeData
///
extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
}