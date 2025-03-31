import 'package:flutter/material.dart';

class ColorPallete {
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color grey = Color.fromARGB(255, 120, 120, 120);
  static const Color red = Color.fromARGB(255, 151, 57, 57);
  static const Color green = Color.fromARGB(255, 247, 252, 245);

  static const MaterialColor primary = MaterialColor(
    0xFF57A9E1, //Primary
    <int, Color>{
      50: Color.fromARGB(255, 238, 246, 252),
      100: Color.fromARGB(255, 203, 228, 246),
      200: Color.fromARGB(255, 178, 215, 241),
      300: Color.fromARGB(255, 141, 197, 235),
      400: Color.fromARGB(255, 121, 186, 231),
      500: Color.fromARGB(255, 87, 169, 225),
      600: Color.fromARGB(255, 79, 154, 205),
      700: Color.fromARGB(255, 62, 120, 160),
      800: Color.fromARGB(255, 48, 93, 124),
      900: Color.fromARGB(255, 37, 71, 95),
    },
  );

  static const MaterialColor secondary = MaterialColor(
    0xFFFCAE51, //Secondary
    <int, Color>{
      50: Color.fromARGB(255, 255, 247, 238),
      100: Color.fromARGB(255, 254, 230, 201),
      200: Color.fromARGB(255, 254, 218, 175),
      300: Color.fromARGB(255, 253, 201, 138),
      400: Color.fromARGB(255, 253, 190, 116),
      500: Color.fromARGB(255, 252, 174, 81),
      600: Color.fromARGB(255, 229, 158, 74),
      700: Color.fromARGB(255, 179, 124, 58),
      800: Color.fromARGB(255, 139, 96, 45),
      900: Color.fromARGB(255, 106, 73, 34),
    },
  );
}
