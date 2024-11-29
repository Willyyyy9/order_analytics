import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/modules/home/controllers/home_controller.dart';
import 'package:order_analytics/app/modules/home/views/widgets/mobile/filter/order_filter_dialog.dart';
import 'package:order_analytics/app/modules/home/views/widgets/mobile/tabs/analytics_tab.dart';
import 'package:order_analytics/app/modules/home/views/widgets/mobile/tabs/timeline_tab.dart';
import 'package:order_analytics/app/resources/asset_manager.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/string_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class HomeMobile extends GetView<HomeController> {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              SvgPicture.asset(IconAssets.flapKap, width: 30, height: 30),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppStrings.orderAnalytics,
                style: getSemiBoldStyle(color: AppColors.white, fontSize: 16),
              )
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.dialog(const OrderFilterDialog());
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SvgPicture.asset(IconAssets.filterIcon,
                  width: 30, height: 40),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          TabBar(
            controller: controller.tabController,
            labelStyle: getSemiBoldStyle(color: AppColors.white, fontSize: 16),
            unselectedLabelStyle:
                getSemiBoldStyle(color: AppColors.lightGrey, fontSize: 14),
            dividerHeight: 0,
            indicatorColor: AppColors.primary,
            tabs: const [
              Tab(text: AppStrings.analytics),
              Tab(text: AppStrings.timeline),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: controller.tabController,
              children: const [AnalyticsTab(), TimelineTab()],
            ),
          ),
        ],
      ),
    );
  }
}
