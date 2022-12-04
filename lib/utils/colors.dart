import 'package:flutter/material.dart';

class CustomColors {
  CustomColors._();

  static const primaryColor = Color(0xFF438883);
  static const primaryColorLight = Color(0xFF63B5AF);


  static const MaterialColor primaryMaterialColor = MaterialColor(
    0xFF438883,
    <int, Color>{
      50: Color(0xFFE5F2D7),
      100: Color(0xFFD6E9C2),
      200: Color(0xFFB9D799),
      300: Color(0xFF9DC470), //disabled color
      400: Color(0xFF80B247),
      500: Color(0xFF63A01E),
      600: Color(0xFF4F8018),
      700: Color(0xFF3B6012),
      800: Color(0xFF438883),
      900: Color(0xFF142006),
    },
  );
}
