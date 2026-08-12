import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/widgets/order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade100,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        leading: IconButton(
          onPressed: () {
            //drawer
          },
          icon: Icon(Icons.menu, color: AppColors.framecolor),
          padding: EdgeInsets.all(20),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Column(
              children: [
                Text(
                  'Good day! Priya👋',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 10,
            top: 70,
            child: Container(
              height: 110,
              width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 250, 250),
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Obx(() {
                if (controller.isWeatherLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.framecolor,
                    ),
                  );
                } else {
                  final data = controller.weather.value;
                  if (data == null) {
                    return Text("No data");
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.cityname.value,
                          style: TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 222, 183, 9),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${data.temperature.round()}°C',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.getWeatherDescription(data.weatherCode),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${data.humidity}%',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '${data.windSpeed}km/h',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
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
            child: Image.asset(
              'assets/welcome_component1.png',
              // colorBlendMode: BlendMode.multiply,
            ),
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
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
                          Text(
                            "Assigned Orders",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //get.toorder page full
                            },
                            child: Text(
                              "ViewAll",
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
                      child: Obx(
                        () => ListView.builder(
                          itemCount: controller.orders.length,
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
                        ),
                      ),
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
