import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_detail_controller.dart';
import '../../home/controllers/home_controller.dart';

class OrderDetailView extends GetView<OrderDetailController> {
  OrderDetailView({super.key});
  final controller1 = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Center(
          child: const Text(
            'Order Details',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tab('All(12)', 0),
                SizedBox(width: 5),
                _tab('Accepted', 1),
                SizedBox(width: 5),
                _tab('Completed', 2),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.filteredOrders.length,
                itemBuilder: (context, index) {
                  final data = controller.filteredOrders[index];
                  return OrderCard(
                    id: data.id,
                    customerName: data.customerName,
                    pickupLocation: data.pickupLocation,
                    deliveryLocation: data.deliveryLocation,
                    amount: data.amount,
                    status: data.status,
                    orderTime: data.orderTime,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(String title, int index) {
    return GestureDetector(
      onTap: () => controller.onTab(index),
      child: Obx(() {
        final isSelected = controller.setTab.value == index;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.framecolor : Colors.black,
              width: 2,
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.framecolor : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
