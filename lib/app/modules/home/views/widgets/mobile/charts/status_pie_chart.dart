import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/modules/home/controllers/home_controller.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class StatusPieChart extends GetView<HomeController> {
  final Map<String, int> statusCounts;

  const StatusPieChart({super.key, required this.statusCounts});

  @override
  Widget build(BuildContext context) {
    final List<PieChartSectionData> sections =
        statusCounts.entries.map((entry) {
      final String status = entry.key;
      final int count = entry.value;

      final Color color = _getColorForStatus(status);

      return PieChartSectionData(
        value: count.toDouble(),
        title:
            '${((count / controller.totalOrders) * 100).toStringAsFixed(0)}%',
        color: color,
        titleStyle: getBoldStyle(fontSize: 14, color: Colors.white),
        radius: 80,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 300,
          child: PieChart(
            PieChartData(
              sections: sections,
              centerSpaceRadius: 50,
              borderData: FlBorderData(show: false),
              sectionsSpace: 2,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: statusCounts.entries.map((entry) {
            final String status = entry.key;
            final int count = entry.value;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _getColorForStatus(status),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$status: $count',
                    style: getRegularStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  Color _getColorForStatus(String status) {
    switch (status) {
      case "ORDERED":
        return const Color(0xff82B2FF);
      case "DELIVERED":
        return const Color(0xff2970FF);
      case "RETURNED":
        return const Color(0xff002F99);
      default:
        return Colors.grey;
    }
  }
}
