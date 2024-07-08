import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/models/weather_model.dart';

class ImageAnimation extends StatelessWidget {
  final Weather? weather;
  const ImageAnimation({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    String getWeatherAnimation(String? mainCondition) {
      if (mainCondition == null) {
        return 'lib/assets/sunny.json'; //default to sunny
      }

      switch (mainCondition.toLowerCase()) {
        case 'clouds':
        case 'mist':
        case 'smoke':
        case 'haze':
        case 'dust':
        case 'fog':
          return 'lib/assets/cloudy.json';
        case 'rain':
        case 'drizzle':
        case 'shower rain':
          return "lib/assets/rainsun.json";
        case 'thunderstrom':
          return "lib/assets/rain.json";
        case 'clear':
          return "lib/assets/sunny.json";
        default:
          return "lib/assets/sunny.json";
      }
    }

    return Container(
      child: Lottie.asset(getWeatherAnimation(weather?.mainCondition)),
    );
  }
}
