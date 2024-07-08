import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/components/image_animation.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  //api key
  final _weatherService = WeatherService('2a7fe88cd9c8e683a5d99c4cc7d80afd');
  Weather? _weather;

  //fetch weather
  _fetchWeather() async {
    //get the current city
    String cityName = await _weatherService.getCurrentCity();

    //get weather for this city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    //any error
    catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //initial state
  @override
  void initState() {
    super.initState();

    //fetch weathe on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Text(
              _weather?.cityName ?? "loading city..",
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 15),

            //animation
            ImageAnimation(
              weather: _weather,
            ),

            const SizedBox(height: 15),

            //temperature
            Text(
              "${_weather?.temperature.round().toString()}°C",
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            //weather condition
            Text(
              _weather?.mainCondition ?? "",
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
