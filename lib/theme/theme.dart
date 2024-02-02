import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: const Color.fromARGB(255, 216, 231, 243),
    primary: Colors.blue.shade200,
    secondary: Colors.grey.shade900,
  ),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: const Color.fromARGB(255, 2, 20, 41),
    primary: Colors.blue.shade800,
    secondary: Colors.grey.shade400,
  ),
);
