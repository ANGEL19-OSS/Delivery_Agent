import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final RxBool isloading = false.obs;
  final RxBool isVisible = false.obs;
  final double storeLat = 10.9993011;
  final double storeLng = 76.9713833;
  final double maxRadiusMeters = 200.0;

  final RxDouble agentLat = 10.9993011.obs;
  final RxDouble agentLng = 76.9713833.obs;

  final RxBool isSimulateOutsideRadius = false.obs;

  Future<bool> islogin() async {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const p = 0.017453292519943295;
    final a =
        0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742000 * asin(sqrt(a));
  }

  double get currentDistanceMeters {
    final currentLat = isSimulateOutsideRadius.value
        ? 11.0500000
        : agentLat.value;
    final currentLng = isSimulateOutsideRadius.value
        ? 76.9900000
        : agentLng.value;
    return calculateDistance(storeLat, storeLng, currentLat, currentLng);
  }

  bool isWithinStoreRadius() {
    return currentDistanceMeters <= maxRadiusMeters;
  }
}
