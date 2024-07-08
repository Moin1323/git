import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: const Color.fromARGB(255, 14, 13, 13),
      primary: const Color.fromARGB(255, 17, 17, 17),
      secondary: Colors.grey.shade700,
      inversePrimary: Colors.grey.shade300,
    ));
