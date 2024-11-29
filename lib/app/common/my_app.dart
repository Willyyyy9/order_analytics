import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/resources/string_manager.dart';
import 'package:order_analytics/app/resources/theme_manager.dart';
import 'package:order_analytics/app/routes/app_pages.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();
  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.orderAnalytics,
      initialRoute: AppPages.INITIAL,
      // initialBinding: SplashBinding(),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      builder: EasyLoading.init(),
      scrollBehavior: AppScrollBehavior(),
      defaultTransition: Transition.noTransition,
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
