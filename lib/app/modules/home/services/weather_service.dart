import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/WeatherModel.dart';

class WeatherService {
  Future<WeatherModel> getWeather({
    required double latitude,
    required double longitude,
  }) async {
    final url = Uri.parse(
      'https://api.open-meteo.com/v1/forecast'
      '?latitude=$latitude'
      '&longitude=$longitude'
      '&current='
      'temperature_2m,'
      'relative_humidity_2m,'
      'weather_code,'
      'wind_speed_10m'
      '&timezone=auto',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return WeatherModel.fromJson(data);
    } else {
      throw Exception('Failed to load weather: ${response.statusCode}');
    }
  }
}
