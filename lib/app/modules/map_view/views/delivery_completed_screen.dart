import 'package:deliveryagent/app/modules/home/models/OrdersModel.dart';
import 'package:deliveryagent/app/routes/app_routes.dart';
import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_strings.dart';
import 'package:deliveryagent/app/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryCompletedScreen extends StatelessWidget {
  const DeliveryCompletedScreen({super.key, required this.orderdata});
  final Ordersmodel orderdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            children: [
              const Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      color: AppColors.amberBgExtraLight,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Icon(
                    Icons.moped,
                    size: 85,
                    color: AppColors.framecolor,
                  ),
                  Positioned(
                    top: 10,
                    right: 15,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.successGreen,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: AppColors.textWhite,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 36),
              const Text(
                AppStrings.deliveryCompleted,
                textAlign: TextAlign.center,
                style: AppTextStyles.h1,
              ),
              const SizedBox(height: 12),
              const Text(
                AppStrings.orderDeliveredSuccessMsg,
                textAlign: TextAlign.center,
                style: AppTextStyles.subtitleGrey,
              ),

              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.framecolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.offAllNamed(Routes.home);
                    Get.snackbar(
                      'Order Delivered 🎉',
                      'Order #${orderdata.id} has been delivered successfully!',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: AppColors.framecolor,
                      colorText: AppColors.background,
                      icon: const Icon(
                        Icons.check_circle_outline,
                        color: AppColors.background,
                      ),
                      duration: const Duration(seconds: 4),
                      margin: const EdgeInsets.all(16),
                      borderRadius: 12,
                    );
                  },
                  child: const Text(
                    AppStrings.great,
                    style: AppTextStyles.buttonText,
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
