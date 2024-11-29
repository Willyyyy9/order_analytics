import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class AppConstants {
  static void configureLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..successWidget = Icon(
        FontAwesomeIcons.circleCheck,
        color: AppColors.success,
        size: 45,
      )
      ..errorWidget = Icon(
        FontAwesomeIcons.circleExclamation,
        color: AppColors.error,
        size: 45,
      )
      ..indicatorSize = 45
      ..radius = 10
      ..progressColor = AppColors.white
      ..progressWidth = 0.5
      ..backgroundColor = AppColors.black.withOpacity(0.8)
      ..indicatorColor = AppColors.white
      ..textColor = AppColors.white
      ..maskColor = AppColors.black.withOpacity(0.5)
      ..userInteractions = true
      ..fontSize = 18
      ..textPadding = const EdgeInsets.symmetric(vertical: 28)
      ..textStyle = getBoldStyle(color: AppColors.white, fontSize: 16)
      ..dismissOnTap = false;
  }
}
