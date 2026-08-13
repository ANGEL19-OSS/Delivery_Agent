import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/constants/app_strings.dart';

void main() {
  runApp(
    // DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      //  builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
