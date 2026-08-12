import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: ListTile(
        title: Text('Weather Info'),
        subtitle: Text('26°C - Partly Cloudy'),
      ),
    );
  }
}
