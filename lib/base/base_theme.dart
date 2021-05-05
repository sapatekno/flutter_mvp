import 'package:flutter/material.dart';

final double _baseSpace = 4;

mixin BaseTheme {
  static MaterialColor colorPrimary = Colors.blue;
  static MaterialAccentColor colorSecondary = Colors.blueAccent;

  static double space(double value) {
    return _baseSpace * value;
  }
}
