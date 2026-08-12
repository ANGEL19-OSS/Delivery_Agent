import 'package:deliveryagent/app/utils/constants/app_colors.dart';
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
        leading: IconButton(
          onPressed: () {
            //drawer
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            top: 60,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(children: [

            ],),
              ),
            ),
          ),
          Positioned(
            top: 70,
            right: 7,
            child: Image.asset(
              'assets/welcome_component1.png',
              colorBlendMode: BlendMode.overlay,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: AppColors.background,
            ),
          ),
        ],
      ),
    );
  }
}
