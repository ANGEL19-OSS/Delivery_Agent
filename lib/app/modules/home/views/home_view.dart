import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_strings.dart';
import 'package:deliveryagent/app/utils/constants/app_text_styles.dart';
import 'package:deliveryagent/app/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: AppColors.framecolor),
              accountName: const Text(
                'Priya',
                style: TextStyle(
                  color: AppColors.background,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              accountEmail: const Text(
                'priya.agent@pazhamudir.com',
                style: TextStyle(color: AppColors.background),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: AppColors.background,
                child: Icon(
                  Icons.person,
                  color: AppColors.framecolor,
                  size: 36,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.dashboard_outlined,
                color: AppColors.framecolor,
              ),
              title: const Text('Dashboard', style: AppTextStyles.bodyMedium),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.dashboard);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.framecolor,
              ),
              title: const Text('Orders', style: AppTextStyles.bodyMedium),
              onTap: () {
                Get.back();
                Get.toNamed(Routes.orderDetail);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: AppColors.framecolor,
              ),
              title: const Text('Profile', style: AppTextStyles.bodyMedium),
              onTap: () {
                Get.back();
                Get.snackbar(
                  'Profile',
                  'Profile details',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: AppColors.amberBgLight,
                );
              },
            ),
            const Divider(color: AppColors.borderLight),
            ListTile(
              leading: const Icon(Icons.logout, color: AppColors.errorRed),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: AppColors.errorRed,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Get.back();
                Get.offAllNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.amberBgLight,
        currentIndex: 0,
        onTap: (value) {
          if (value == 0) {
            Get.toNamed(Routes.home);
          } else if (value == 1) {
            Get.toNamed(Routes.orderDetail);
          } else if (value == 2) {
            Get.toNamed(Routes.dashboard);
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: AppColors.framecolor),
            label: AppStrings.navHome,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, color: AppColors.framecolor),
            label: AppStrings.navOrders,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet, color: AppColors.framecolor),
            label: AppStrings.navEarnings,
          ),
        ],
      ),

      backgroundColor: AppColors.amberBgLight,
      appBar: AppBar(
        backgroundColor: AppColors.amberBgLight,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: AppColors.framecolor),
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
      body: Stack(
        children: [
          const Positioned(
            top: 20,
            left: 20,
            child: Column(
              children: [Text(AppStrings.greeting, style: AppTextStyles.h1)],
            ),
          ),
          Positioned(
            left: 10,
            top: 70,
            child: Container(
              height: 110,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.cardBgLight,
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.borderLight,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Obx(() {
                if (controller.isWeatherLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.framecolor,
                    ),
                  );
                } else {
                  final data = controller.weather.value;
                  if (data == null) {
                    return const Text(AppStrings.noData);
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.cityname.value,
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.accentYellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${data.temperature.round()}°C',
                          style: AppTextStyles.h3,
                        ),
                        Text(
                          controller.getWeatherDescription(data.weatherCode),
                          style: AppTextStyles.subtitleGreyBold.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${data.humidity}%',
                              style: AppTextStyles.subtitleGreyBold.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '${data.windSpeed}km/h',
                              style: AppTextStyles.subtitleGreyBold.copyWith(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              }),
            ),
          ),
          Positioned(
            top: -40,
            right: -40,
            width: 250,
            height: 300,
            child: Image.asset('assets/welcome_component1.png'),
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                color: AppColors.background,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            AppStrings.assignedOrders,
                            style: AppTextStyles.h5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.orderDetail);
                            },
                            child: const Text(
                              AppStrings.viewAll,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.framecolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        if (controller.orders.isEmpty) {
                          return const Center(
                            child: Text(
                              AppStrings.noAssignedOrders,
                              style: AppTextStyles.subtitleGrey,
                            ),
                          );
                        }
                        final displayCount = controller.orders.length > 2
                            ? 2
                            : controller.orders.length;
                        return ListView.builder(
                          itemCount: displayCount,
                          itemBuilder: (context, index) {
                            final data = controller.orders[index];
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
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
