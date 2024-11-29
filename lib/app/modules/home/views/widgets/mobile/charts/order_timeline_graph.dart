import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class OrderTimelineGraph extends StatelessWidget {
  final Map<DateTime, int> ordersByDate;

  const OrderTimelineGraph({super.key, required this.ordersByDate});

  @override
  Widget build(BuildContext context) {
    final List<BarChartGroupData> barGroups = ordersByDate.entries.map((entry) {
      final x = entry.key.millisecondsSinceEpoch.toDouble();
      final y = entry.value.toDouble();
      return BarChartGroupData(
        x: x.toInt(),
        barRods: [
          BarChartRodData(
            toY: y,
            color: Colors.blue,
            width: 20,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    }).toList();

    const double minY = 0;
    final double maxY =
        ordersByDate.values.reduce((a, b) => a > b ? a : b).toDouble() + 1;

    return SizedBox(
      height: 500,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          barGroups: barGroups,
          gridData: const FlGridData(show: true),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey),
          ),
          titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) => Text(
                  value.toInt().toString(),
                  style: getRegularStyle(color: AppColors.white),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                reservedSize: 100,
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final date =
                      DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      DateFormat('MMM yyyy').format(date),
                      style: getRegularStyle(fontSize: 10, color: Colors.white),
                    ),
                  );
                },
                interval: (ordersByDate.length ~/ 5) == 0
                    ? 5
                    : (ordersByDate.length ~/ 5).toDouble(),
              ),
            ),
          ),
          maxY: maxY,
          minY: minY,
        ),
      ),
    );
  }
}
