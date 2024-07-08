// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather/pages/weather_page.dart';
import 'package:weather/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherPage(),
      theme: darkMode,
    );
  }
}
