class WeatherModel {
  final double temperature;
  final int weatherCode;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.temperature,
    required this.weatherCode,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'];

    return WeatherModel(
      temperature: (current['temperature_2m'] as num).toDouble(),
      weatherCode: current['weather_code'] as int,
      humidity: current['relative_humidity_2m'] as int,
      windSpeed: (current['wind_speed_10m'] as num).toDouble(),
    );
  }
}
