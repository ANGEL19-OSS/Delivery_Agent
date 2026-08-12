import 'package:deliveryagent/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import '../modules/checkin/views/checkin_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order_detail/views/order_detail_view.dart';
import '../modules/splash/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(name: Routes.checkin, page: () => const CheckinView()),
    GetPage(name: Routes.home, page: () => const HomeView()),
    GetPage(name: Routes.orderDetail, page: () => const OrderDetailView()),
    GetPage(name: Routes.dashboard, page: () => const DashboardView()),
  ];
}
