class Weather {
  final String location;
  final double temperature;
  final double min;
  final double max;
  final String description;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final double windDirection;
  final double sunRise;
  final double sunSet;
  final double visibility;
  final double cloudiness;

  Weather({
    required this.location,
    required this.temperature,
    required this.min,
    required this.max,
    required this.description,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.sunRise,
    required this.sunSet,
    required this.visibility,
    required this.cloudiness,
  });
}
