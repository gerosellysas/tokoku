import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFFB6976);
  static const Color secondary = Color(0xFFFEBE16);
  static const Color white = Color(0xFFFCFCF5);
  static const Color black = Color(0xFF30303A);
  static const Color darkGrey = Color(0xFFAAAFB4);
  static const Color grey = Color(0xFFE1E3E0);
  static const Color lightGrey = Color(0xFFF3F4EE);
  static const Color red = Color(0xFFEE2128);

  static const MaterialColor material = MaterialColor(_material, <int, Color>{
    50: Color(0xFFFFF4F0),
    100: Color(0xFFFEE4D9),
    200: Color(0xFFFED2C0),
    300: Color(0xFFFEBFA6),
    400: Color(0xFFFDB293),
    500: Color(_material),
    600: Color(0xFFFD9C78),
    700: Color(0xFFFC926D),
    800: Color(0xFFFC8963),
    900: Color(0xFFFC7850),
  });

  static const int _material = 0xFFFDA480;
}
