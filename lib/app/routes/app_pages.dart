import 'package:deliveryagent/app/modules/home/controllers/home_controller.dart';
import 'package:deliveryagent/app/modules/login/controllers/login_controller.dart';
import 'package:deliveryagent/app/modules/map_view/controllers/map_controller.dart';
import 'package:deliveryagent/app/modules/map_view/views/map_view.dart';
import 'package:deliveryagent/app/modules/order_detail/controllers/order_detail_controller.dart';
import 'package:get/get.dart';
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

    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(
        () => Get.lazyPut<HomeController>(() => HomeController()),
      ),
    ),
    GetPage(
      name: Routes.orderDetail,
      page: () => OrderDetailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<OrderDetailController>(() => OrderDetailController());
        if (!Get.isRegistered<HomeController>()) {
          Get.lazyPut<HomeController>(() => HomeController());
        }
      }),
    ),
    GetPage(
      name: Routes.mapView,
      page: () => const MapView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<MapController>(() => MapController());
        if (!Get.isRegistered<HomeController>()) {
          Get.lazyPut<HomeController>(() => HomeController());
        }
      }),
    ),
    GetPage(name: Routes.dashboard, page: () => const DashboardView()),
  ];
}
