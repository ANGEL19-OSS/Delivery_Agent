import 'package:get/get.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/models/OrdersModel.dart';

class OrderDetailController extends GetxController {
  final HomeController homeController = Get.isRegistered<HomeController>()
      ? Get.find<HomeController>()
      : Get.put(HomeController());

  var setTab = 0.obs;

  void onTab(int index) {
    setTab.value = index;
  }

  List<Ordersmodel> get filteredOrders {
    final currentTab = setTab.value;
    final allOrders = homeController.orders;
    if (currentTab == 1) {
      return allOrders
          .where((o) => o.status.toLowerCase() == 'accepted')
          .toList();
    } else if (currentTab == 2) {
      return allOrders
          .where((o) => o.status.toLowerCase() == 'completed')
          .toList();
    }
    return allOrders;
  }
}
