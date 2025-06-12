import 'package:flutter/material.dart';

// final ThemeData lightMode = ThemeData(
//   fontFamily: 'Nunito',
//   colorScheme: ColorScheme.light(
//     primary: Color.fromARGB(255, 73, 124, 85),
//     onPrimary: Color.fromARGB(255, 252, 245, 235),
//     secondary: Color.fromARGB(255, 255, 238, 217),
//     onSecondary: Color.fromARGB(255, 14, 10, 6),
//     surface: Color.fromARGB(255, 255, 220, 177),
//     onSurface: Color.fromARGB(255, 14, 10, 6),
//     error: Color.fromARGB(255, 179, 64, 85),
//   ),
// );

final ThemeData lightMode = ThemeData(
  fontFamily: 'Nunito',
  colorScheme: ColorScheme.light(
    primary: Color.fromARGB(255, 73, 124, 85),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color(0xFFDFDFDF),
    onSecondary: Color(0xFF1A1A1A),
    tertiary: Color.fromRGBO(46, 46, 46, 1),
    onTertiary: Color(0xFFEFEFEF),
    surface: Color(0xFFBABABA),
    onSurface: Color.fromARGB(255, 18, 18, 18),
    error: Color.fromARGB(255, 197, 80, 80),
  ),
);
