import 'package:flutter/material.dart';

final double _baseSpace = 4;

class BaseTheme {
  static MaterialColor colorPrimary = Colors.amber;
  static MaterialAccentColor colorSecondary = Colors.blueAccent;

  static double space(double value) {
    return _baseSpace * value;
  }

  static ThemeData themeLight() {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: BaseTheme.colorPrimary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData themeDark() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: BaseTheme.colorPrimary,
      accentColor: Colors.orange[500],
      toggleableActiveColor: Colors.orange[500],
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.orange[200]),
    );
  }
}
