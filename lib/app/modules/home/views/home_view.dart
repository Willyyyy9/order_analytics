import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/common/widgets/app_responsive.dart';
import 'package:order_analytics/app/modules/home/views/responsive/home_desktop.dart';
import 'package:order_analytics/app/modules/home/views/responsive/home_mobile.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppResponsive(
        mobile: HomeMobile(), tablet: HomeMobile(), desktop: HomeDesktop());
  }
}
