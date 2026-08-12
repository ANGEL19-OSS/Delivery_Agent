import 'package:deliveryagent/app/utils/constants/app_colors.dart';
import 'package:deliveryagent/app/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/locating_card.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  void _showPopUpCard(
    Widget cardWidget, {
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.dialog(cardWidget, barrierDismissible: true);
    Future.delayed(duration, () {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/welcome_background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 200,
            right: -45,
            child: Image.asset(
              'assets/welcome_component1.png',
              height: 300,
              colorBlendMode: BlendMode.multiply,
            ),
          ),
          SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.background,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.welcome,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Login to continue',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(height: 10),
                              Form(
                                key: controller.formkey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 12,
                                            ),
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: const Color.fromARGB(
                                            255,
                                            238,
                                            196,
                                            9,
                                          ),
                                          size: 20,
                                        ),
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          borderSide: BorderSide(
                                            color: AppColors.surface,
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email id';
                                        } else if (!value.contains('@')) {
                                          return 'Please enter a valid email id';
                                        }
                                        final emailRegex = RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                        );

                                        if (!emailRegex.hasMatch(
                                          value.trim(),
                                        )) {
                                          return "Enter a valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 12),
                                    Obx(
                                      () => TextFormField(
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 12,
                                              ),
                                          prefixIcon: Icon(
                                            Icons.lock_clock_outlined,
                                            color: const Color.fromARGB(
                                              255,
                                              238,
                                              196,
                                              9,
                                            ),
                                            size: 20,
                                          ),
                                          labelText: 'Password',
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.isVisible.value =
                                                  !controller.isVisible.value;
                                            },
                                            icon: Icon(
                                              controller.isVisible.value
                                                  ? Icons.visibility
                                                  : Icons
                                                        .visibility_off_outlined,
                                              color: const Color.fromARGB(
                                                255,
                                                238,
                                                196,
                                                9,
                                              ),
                                              size: 20,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            borderSide: const BorderSide(
                                              color: Color.fromARGB(
                                                255,
                                                231,
                                                231,
                                                231,
                                              ),
                                            ),
                                          ),
                                        ),
                                        obscureText:
                                            !controller.isVisible.value,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your password';
                                          } else if (value.length < 8) {
                                            return 'Please enter a valid password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: const Color.fromARGB(
                                              255,
                                              238,
                                              196,
                                              9,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                            255,
                                            238,
                                            196,
                                            9,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        onPressed: () async {
                                          bool isFormValid = await controller
                                              .islogin();
                                          if (!isFormValid) {
                                            _showPopUpCard(
                                              const ErrorCard(
                                                message:
                                                    'Please fill in valid credentials.',
                                              ),
                                            );
                                            return;
                                          }

                                          // 1. Show Locating Splash Dialog
                                          Get.dialog(
                                            const LocatingCard(
                                              message: 'Locating.......',
                                            ),
                                            barrierDismissible: false,
                                          );

                                          // 2. Wait for locating delay (1.5 seconds)
                                          await Future.delayed(
                                            const Duration(milliseconds: 1500),
                                          );

                                          // Close Locating Dialog
                                          if (Get.isDialogOpen ?? false) {
                                            Get.back();
                                          }

                                          // 3. Verify Store Radius Check-in
                                          bool isWithinRadius = controller
                                              .isWithinStoreRadius();
                                          double distance =
                                              controller.currentDistanceMeters;

                                          if (isWithinRadius) {
                                            _showPopUpCard(
                                              SuccessfulCard(
                                                message:
                                                    'Check-in successful!\nYou are within ${distance.toStringAsFixed(1)}m of Pazhamudir Nilayam.',
                                              ),
                                              duration: const Duration(
                                                seconds: 2,
                                              ),
                                            );
                                            await Future.delayed(
                                              const Duration(seconds: 2),
                                            );
                                            if (Get.isDialogOpen ?? false) {
                                              Get.back();
                                            }
                                            Get.offAllNamed(Routes.home);
                                          } else {
                                            _showPopUpCard(
                                              ErrorCard(
                                                message:
                                                    'Check-in failed!\nYou are ${distance.toStringAsFixed(1)}m away. Must be within 200m radius of store.',
                                              ),
                                              duration: const Duration(
                                                seconds: 3,
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text(
                                          'Login',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              245,
                                              243,
                                              243,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuccessfulCard extends StatelessWidget {
  final String message;
  const SuccessfulCard({super.key, this.message = AppStrings.msgLoginSuccess});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 16),
            const Text(
              'Success',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorCard extends StatelessWidget {
  final String message;
  const ErrorCard({super.key, this.message = AppStrings.errWrongPassword});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 60),
            const SizedBox(height: 16),
            const Text(
              'Error',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
