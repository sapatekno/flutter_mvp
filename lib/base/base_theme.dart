import 'package:flutter/material.dart';

final double _baseSpace = 4;

class BaseTheme {
  static MaterialColor colorPrimary = Colors.amber;
  static MaterialAccentColor colorSecondary = Colors.blueAccent;

  static double space(double value) {
    return _baseSpace * value;
  }
}
