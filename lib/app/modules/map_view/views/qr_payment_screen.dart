import 'package:deliveryagent/app/modules/home/models/OrdersModel.dart';
import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_strings.dart';
import 'package:deliveryagent/app/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_delivered_screen.dart';

class QRPaymentScreen extends StatelessWidget {
  const QRPaymentScreen({super.key, required this.orderdata});
  final Ordersmodel orderdata;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.amberBgExtraLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.background,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.textBlack),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                AppStrings.showQrToCustomer,
                textAlign: TextAlign.center,
                style: AppTextStyles.h2,
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.scanAndPay,
                style: AppTextStyles.subtitleGrey,
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowBlack12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Icon(Icons.qr_code_2, size: 190, color: AppColors.textBlack),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.orderId,
                          style: AppTextStyles.bodyGrey,
                        ),
                        Text(
                          '#${orderdata.id}',
                          style: AppTextStyles.bodyBold,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.amount,
                          style: AppTextStyles.bodyGrey,
                        ),
                        Text(
                          '₹${orderdata.amount.toStringAsFixed(0)}',
                          style: AppTextStyles.h4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                AppStrings.paymentConfirmNotice,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyGrey,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.framecolor, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => OrderDeliveredScreen(orderdata: orderdata));
                  },
                  child: const Text(
                    AppStrings.cancel,
                    style: AppTextStyles.buttonTextFrame,
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
