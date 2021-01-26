import 'package:flutter/material.dart';

final double _baseSpace = 4;

mixin BaseTheme {
  static MaterialColor colorPrimary = Colors.teal;
  static Color colorSecondary = Color(0xFF96000F);

  static double space(double value) {
    return _baseSpace * value;
  }
}
