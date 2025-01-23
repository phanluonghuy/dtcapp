import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF71BF45);
  static const Color secondaryColor = Color(0xFF117D41);
  static const int _primaryValue = 0xFF71BF45;

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(0xFFE4F3E1), // Lightest
      100: Color(0xFFCAE8C3),
      200: Color(0xFFADDCA1),
      300: Color(0xFF8FCF7F),
      400: Color(0xFF78C560),
      500: Color(_primaryValue), // Primary color
      600: Color(0xFF65B33E),
      700: Color(0xFF58A836),
      800: Color(0xFF4A9C2E),
      900: Color(0xFF31871F), // Darkest
    },
  );
}
