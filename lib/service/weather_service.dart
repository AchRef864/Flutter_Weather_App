import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  final String apiKey;

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(String city) async {
    final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
    final Uri uri =
        Uri.parse('$baseUrl?q=$city&appid=$apiKey'); // Convert string to Uri
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Weather(
        location: data['name'],
        temperature: data['main']['temp'] - 273.15,
        min: data['main']['temp_min'] - 273.15,
        max: data['main']['temp_max'] - 273.15,
        description: data['weather'][0]['description'],
        humidity: data['main']['humidity'].toDouble(),
        pressure: data['main']['pressure'].toDouble(),
        windSpeed: data['wind']['speed'].toDouble(),
        windDirection: data['wind']['deg'].toDouble(),
        sunRise: data['sys']['sunrise'].toDouble(),
        sunSet: data['sys']['sunset'].toDouble(),
        visibility: data['visibility'].toDouble(),
        cloudiness: data['clouds']['all'].toDouble(),
      );
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
