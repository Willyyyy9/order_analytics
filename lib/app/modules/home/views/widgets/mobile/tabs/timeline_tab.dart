import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/common/empty_state.dart';
import 'package:order_analytics/app/modules/home/controllers/home_controller.dart';
import 'package:order_analytics/app/modules/home/views/widgets/mobile/charts/order_timeline_graph.dart';

class TimelineTab extends GetView<HomeController> {
  const TimelineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.allOrders.isEmpty) {
        return const Center(
            child: EmptyState(
          title: "No Orders",
          subtitle: "No orders available",
        ));
      }

      return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              OrderTimelineGraph(ordersByDate: controller.ordersByMonth),
            ],
          ),
        ),
      );
    });
  }
}
