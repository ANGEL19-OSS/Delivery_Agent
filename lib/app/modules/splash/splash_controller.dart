import 'package:deliveryagent/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    onsplash();
  }
  Future<void> onsplash() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(Routes.login);
  }
}
