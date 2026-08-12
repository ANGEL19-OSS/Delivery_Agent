import 'package:deliveryagent/app/modules/home/models/OrdersModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

import '../models/WeatherModel.dart';
import '../services/weather_service.dart';
import '../services/location_service.dart';

class HomeController extends GetxController {
  final WeatherService weatherService = WeatherService();

  final LocationService locationService = LocationService();
  Rxn<WeatherModel> weather = Rxn<WeatherModel>();
  RxInt currentIndex = 0.obs;
  RxBool isWeatherLoading = true.obs;
  RxString weatherError = ''.obs;
  var cityname = 'Loading...'.obs;
  RxList<Ordersmodel> orders = <Ordersmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getWeather();
    loadorderslist();
  }

  void loadorderslist() {
    orders.assignAll(dummyorders);
  }

  Future<void> getWeather() async {
    try {
      isWeatherLoading.value = true;

      weatherError.value = '';

      Position position = await locationService.getCurrentLocation();

      cityname.value = await locationService.getCityName(position);

      print('Latitude: ${position.latitude}');

      print('Longitude: ${position.longitude}');

      WeatherModel result = await weatherService.getWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      weather.value = result;
    } catch (e) {
      weatherError.value = e.toString();

      debugPrint('Weather Error: $e');
    } finally {
      isWeatherLoading.value = false;
    }
  }

  String getWeatherDescription(int code) {
    switch (code) {
      case 0:
        return 'Clear Sky';

      case 1:
        return 'Mainly Clear';

      case 2:
        return 'Partly Cloudy';

      case 3:
        return 'Overcast';

      case 45:
      case 48:
        return 'Foggy';

      case 51:
      case 53:
      case 55:
        return 'Drizzle';

      case 61:
      case 63:
      case 65:
        return 'Rain';

      case 71:
      case 73:
      case 75:
        return 'Snow';

      case 80:
      case 81:
      case 82:
        return 'Rain Showers';

      case 95:
      case 96:
      case 99:
        return 'Thunderstorm';

      default:
        return 'Unknown';
    }
  }

  IconData getWeatherIcon(int code) {
    if (code == 0) {
      return Icons.wb_sunny;
    }

    if (code >= 1 && code <= 3) {
      return Icons.cloud;
    }

    if (code >= 51 && code <= 67) {
      return Icons.grain;
    }

    if (code >= 80 && code <= 82) {
      return Icons.water_drop;
    }

    if (code >= 95) {
      return Icons.thunderstorm;
    }

    return Icons.wb_sunny;
  }

  List<Ordersmodel> dummyorders = [
    Ordersmodel(
      id: 'SL1001',
      customerName: 'Rahul Kumar',
      pickupLocation:
          '41, Government Arts College Rd, Opposite District Court, Gopalapuram, Coimbatore, Tamil Nadu 641018',
      deliveryLocation: 'Avinashi Road',
      amount: 245.00,
      status: 'Pending',
      orderTime: '10:30 AM',
    ),

    Ordersmodel(
      id: 'SL1002',
      customerName: 'Priya Sharma',
      pickupLocation:
          '41, Government Arts College Rd, Opposite District Court, Gopalapuram, Coimbatore, Tamil Nadu 641018',
      deliveryLocation: 'RS Puram',
      amount: 180.00,
      status: 'Accepted',
      orderTime: '11:15 AM',
    ),

    Ordersmodel(
      id: 'SL1003',
      customerName: 'Arun Raj',
      pickupLocation:
          '41, Government Arts College Rd, Opposite District Court, Gopalapuram, Coimbatore, Tamil Nadu 641018',
      deliveryLocation: 'Singanallur',
      amount: 320.00,
      status: 'Completed',
      orderTime: '12:00 PM',
    ),

    Ordersmodel(
      id: 'SL1004',
      customerName: 'Meena',
      pickupLocation:
          '41, Government Arts College Rd, Opposite District Court, Gopalapuram, Coimbatore, Tamil Nadu 641018',
      deliveryLocation: 'Ukkadam',
      amount: 150.00,
      status: 'Pending',
      orderTime: '12:45 PM',
    ),
  ];
}
