import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_text_styles.dart';
import 'package:deliveryagent/app/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/app_strings.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.amberBgLight,
      appBar: AppBar(
        backgroundColor: AppColors.amberBgLight,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: AppColors.accentYellow),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.greeting, style: AppTextStyles.h1),
              SizedBox(height: 5),
              Text(
                'Ready to deliver Happiness?',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _containerbox(
                    Icon(Icons.inventory_2_rounded),
                    'Assigned',
                    12,
                  ),
                  _containerbox(
                    Icon(Icons.access_time_rounded),
                    'InProgress',
                    8,
                  ),
                  _containerbox(
                    Icon(Icons.check_circle_rounded),
                    'Delivered',
                    6,
                  ),
                ],
              ),
              SizedBox(height: 5),
              StatCard(),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.borderLight),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadowBlack12,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Performance', style: AppTextStyles.h1),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Completion Rate', style: AppTextStyles.bodyBold),
                        Text('90%', style: AppTextStyles.bodyBold),
                      ],
                    ),
                    LinearProgressIndicator(
                      value: 0.95,
                      color: const Color.fromARGB(255, 249, 176, 7),
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On-time Delivery Rate',
                          style: AppTextStyles.bodyBold,
                        ),
                        Text('80%', style: AppTextStyles.bodyBold),
                      ],
                    ),
                    LinearProgressIndicator(
                      value: 0.80,
                      color: AppColors.accentYellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _containerbox(Icon icon, String mess, int number) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowBlack12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon.icon,
            color: mess == 'Assigned'
                ? Colors.orangeAccent
                : mess == 'InProgress'
                ? Colors.amber
                : mess == 'Delivered'
                ? Colors.greenAccent
                : AppColors.primary,
          ),
          SizedBox(height: 5),
          Text(number.toString()),
          SizedBox(height: 4),
          Text(
            mess,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
