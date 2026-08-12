import 'package:deliveryagent/app/modules/home/models/OrdersModel.dart';
import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'qr_payment_screen.dart';

class ReachedCustomerScreen extends StatelessWidget {
  ReachedCustomerScreen({required this.orderdata});
  final Ordersmodel orderdata;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/map_background.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 200,
            bottom: 200,
            right: 30,
            left: 30,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/reached_customer.png'),
                  SizedBox(height: 5),
                  Text(
                    'You have reached customer destination',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    orderdata.deliveryLocation ?? '',
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.framecolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => QRPaymentScreen(orderdata: orderdata));
                    },
                    child: Text(
                      'Reached Customer',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
