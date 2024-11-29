import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/data/utils/string_extensions.dart';
import 'package:order_analytics/app/modules/home/controllers/home_controller.dart';
import 'package:order_analytics/app/modules/home/views/widgets/mobile/charts/status_pie_chart.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/string_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class AnalyticsTab extends GetView<HomeController> {
  const AnalyticsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.totalOrderPrices,
                        style: getRegularStyle(
                            color: AppColors.white, fontSize: 14)),
                    Text(
                        "\$${controller.totalPrices.toString().toFormattedNumber()}",
                        style: getMediumStyle(
                            color: AppColors.white, fontSize: 32)),
                  ],
                )),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.totalOrders,
                              style: getRegularStyle(
                                  color: AppColors.white, fontSize: 14)),
                          Text(controller.totalOrders.toString(),
                              style: getMediumStyle(
                                  color: AppColors.white, fontSize: 32)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.activeOrders,
                              style: getRegularStyle(
                                  color: AppColors.white, fontSize: 14)),
                          Text(controller.activeOrdersCount.toString(),
                              style: getMediumStyle(
                                  color: AppColors.white, fontSize: 32)),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.returnedOrders,
                              style: getRegularStyle(
                                  color: AppColors.white, fontSize: 14)),
                          Text(controller.returnedOrdersCount.toString(),
                              style: getMediumStyle(
                                  color: AppColors.white, fontSize: 32)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.inactiveOrders,
                              style: getRegularStyle(
                                  color: AppColors.white, fontSize: 14)),
                          Text(controller.inactiveOrdersCount.toString(),
                              style: getMediumStyle(
                                  color: AppColors.white, fontSize: 32)),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.averageOrderPrice,
                        style: getRegularStyle(
                            color: AppColors.white, fontSize: 14)),
                    Text(
                        "\$${controller.averageOrderPrice.toString().toFormattedNumber()}",
                        style: getMediumStyle(
                            color: AppColors.white, fontSize: 32)),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.highestOrderPrice,
                        style: getRegularStyle(
                            color: AppColors.white, fontSize: 14)),
                    Text(
                        "\$${controller.highestOrderPrice.toString().toFormattedNumber()}",
                        style: getMediumStyle(
                            color: AppColors.white, fontSize: 32)),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.lowesetOrderPrice,
                        style: getRegularStyle(
                            color: AppColors.white, fontSize: 14)),
                    Text(
                        "\$${controller.lowestOrderPrice.toString().toFormattedNumber()}",
                        style: getMediumStyle(
                            color: AppColors.white, fontSize: 32)),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Text(AppStrings.numbersPerStatus,
                style: getRegularStyle(color: AppColors.white, fontSize: 14)),
            Obx(() => StatusPieChart(statusCounts: controller.statusCounts))
          ],
        ),
      ),
    );
  }
}
