import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Weather? _weather;
  final String apiKey = 'a14f1bb6b9103f4e98a0e84d5a389778';

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      WeatherService weatherService = WeatherService(apiKey: apiKey);
      Weather weather = await weatherService.getWeather('London');
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _weather != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Location: ${_weather!.location}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Temperature: ${_weather!.temperature.toInt()}°C',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    'Min: ${_weather!.min.toInt()}°C',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  Text(
                    'Max: ${_weather!.max.toInt()}°C',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Description: ${_weather!.description}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Humidity: ${_weather!.humidity.toInt()}%',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Humidity: ${_weather!.humidity.toInt()}%',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Pressure: ${_weather!.pressure.toInt()}hPa',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Wind Speed: ${_weather!.windSpeed} km/h',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Wind Direction: ${_weather!.windDirection.toInt()}°',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Visibility: ${_weather!.visibility.toInt()} m',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 9.0),
                  Text(
                    'Cloudiness: ${_weather!.cloudiness} m',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
