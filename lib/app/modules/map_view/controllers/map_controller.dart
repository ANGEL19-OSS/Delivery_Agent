import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/models/OrdersModel.dart';

class MapController extends GetxController {
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  Rxn<Ordersmodel> order = Rxn<Ordersmodel>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Ordersmodel) {
      order.value = Get.arguments as Ordersmodel;
    } else if (homeController.orders.isNotEmpty) {
      order.value = homeController.orders.first;
    } else {
      order.value = Ordersmodel(
        id: 'SL1001',
        customerName: 'Rahul Kumar',
        pickupLocation:
            '41, Government Arts College Rd, Opposite District Court, Gopalapuram, Coimbatore, Tamil Nadu 641018',
        deliveryLocation: '12, Lake View Rd, Nungambakkam',
        amount: 245.00,
        status: 'Accepted',
        orderTime: '10:30 AM',
      );
    }
  }

  void recenterMap() {
    Get.snackbar(
      'Map Centered',
      'Location centered on delivery route',
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 1),
    );
  }
}
