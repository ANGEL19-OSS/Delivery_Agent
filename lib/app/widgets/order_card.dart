import 'package:deliveryagent/app/modules/home/models/OrdersModel.dart';
import 'package:deliveryagent/app/routes/app_routes.dart';
import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_strings.dart';
import 'package:deliveryagent/app/utils/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.id,
    required this.customerName,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.amount,
    required this.status,
    required this.orderTime,
  });

  final String id;
  final String customerName;
  final String pickupLocation;
  final String deliveryLocation;
  final double amount;
  final String status;
  final String orderTime;

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
        return AppColors.statusAccepted;
      case 'completed':
        return AppColors.statusCompleted;
      case 'pending':
      default:
        return AppColors.statusPending;
    }
  }

  Color _getStatusBgColor(String status) {
    switch (status.toLowerCase()) {
      case 'accepted':
        return AppColors.statusAcceptedBg;
      case 'completed':
        return AppColors.statusCompletedBg;
      case 'pending':
      default:
        return AppColors.statusPendingBg;
    }
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Ordersmodel(
      id: id,
      customerName: customerName,
      pickupLocation: pickupLocation,
      deliveryLocation: deliveryLocation,
      amount: amount,
      status: status,
      orderTime: orderTime,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowBlack12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '#$id',
                style: AppTextStyles.h5.copyWith(color: AppColors.textBlack87),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _getStatusBgColor(status),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: _getStatusColor(status),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '₹${amount.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: AppColors.framecolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(height: 1, color: AppColors.borderLight),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person_outline,
                    size: 16,
                    color: AppColors.textGrey,
                  ),
                  const SizedBox(width: 4),
                  Text(customerName, style: AppTextStyles.bodyMedium),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    size: 14,
                    color: AppColors.textGrey,
                  ),
                  const SizedBox(width: 4),
                  Text(orderTime, style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.circle,
                  size: 12,
                  color: AppColors.successGreen,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.pickupLocationHeader,
                      style: AppTextStyles.smallCaption,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      pickupLocation,
                      style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 4, bottom: 4),
            child: SizedBox(
              height: 12,
              child: VerticalDivider(
                width: 1,
                thickness: 1.5,
                color: AppColors.dividerDark,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.location_on,
                  size: 14,
                  color: AppColors.errorRedAccent,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.deliveryLocationHeader,
                      style: AppTextStyles.smallCaption,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      deliveryLocation,
                      style: AppTextStyles.bodyMedium.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.framecolor,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
              ),
              onPressed: () {
                if (orderData.status.toLowerCase() == 'pending') {
                  showDialog(
                    context: context,
                    builder: (context) => SuccessfulCard(orderData: orderData),
                  );
                }
              },
              child: Text(
                status.toLowerCase() == 'accepted'
                    ? AppStrings.btnInProgress
                    : status.toLowerCase() == 'completed'
                    ? AppStrings.btnViewDetails
                    : AppStrings.btnAcceptOrder,
                style: const TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessfulCard extends StatelessWidget {
  const SuccessfulCard({super.key, this.orderData});

  final Ordersmodel? orderData;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: AppColors.textGrey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.lightYellowBg,
              child: Icon(Icons.check_circle, color: AppColors.framecolor),
            ),
            const SizedBox(height: 5),
            const Text(AppStrings.orderAccepted, style: AppTextStyles.bodyBold),
            const SizedBox(height: 3),
            const Text(
              AppStrings.orderAcceptedMsg1,
              style: AppTextStyles.subtitleGrey,
            ),
            const Text(
              AppStrings.orderAcceptedMsg2,
              textAlign: TextAlign.center,
              style: AppTextStyles.subtitleGrey,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.framecolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Get.back();
                Get.toNamed(Routes.mapView, arguments: orderData);
              },
              child: const Text(AppStrings.ok),
            ),
          ],
        ),
      ),
    );
  }
}
