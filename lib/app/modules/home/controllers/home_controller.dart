import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:order_analytics/app/data/models/order.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final RxList<Order> allOrders = <Order>[].obs;
  Rx<DateTime?> startFilterDate = Rx<DateTime?>(null);
  Rx<DateTime?> endFilterDate = Rx<DateTime?>(null);

  late TabController tabController;

  Map<DateTime, int> get ordersByMonth {
    final Map<String, int> tempMap = {};
    for (var order in allOrders) {
      final String monthKey = DateFormat('yyyy-MM').format(order.registered);
      tempMap[monthKey] = (tempMap[monthKey] ?? 0) + 1;
    }
    return tempMap.map((key, value) {
      final date = DateTime.parse("$key-01");
      return MapEntry(date, value);
    });
  }

  int get totalOrders => allOrders.length;

  int get activeOrdersCount =>
      allOrders.where((order) => order.isActive).length;

  int get inactiveOrdersCount =>
      allOrders.where((order) => !order.isActive).length;

  double get averageOrderPrice {
    if (allOrders.isEmpty) return 0.0;
    final double totalPrice = allOrders.fold(
      0.0,
      (sum, order) =>
          sum +
          double.parse(order.price.replaceAll('\$', '').replaceAll(',', '')),
    );
    return totalPrice / allOrders.length;
  }

  double get highestOrderPrice {
    if (allOrders.isEmpty) return 0.0;
    return allOrders
        .map((order) =>
            double.parse(order.price.replaceAll('\$', '').replaceAll(',', '')))
        .reduce((a, b) => a > b ? a : b);
  }

  double get lowestOrderPrice {
    if (allOrders.isEmpty) return 0.0;
    return allOrders
        .map((order) =>
            double.parse(order.price.replaceAll('\$', '').replaceAll(',', '')))
        .reduce((a, b) => a < b ? a : b);
  }

  Order? get highestOrderPriceObject {
    if (allOrders.isEmpty) return null;
    final double highestPrice = highestOrderPrice;
    return allOrders.firstWhere((order) =>
        double.parse(order.price.replaceAll('\$', '').replaceAll(',', '')) ==
        highestPrice);
  }

  double get totalPrices {
    if (allOrders.isEmpty) return 0.0;

    return allOrders.fold(
      0.0,
      (sum, order) =>
          sum +
          double.parse(order.price.replaceAll('\$', '').replaceAll(',', '')),
    );
  }

  Order? get lowestOrderPriceObject {
    if (allOrders.isEmpty) return null;
    final double lowestPrice = lowestOrderPrice;
    return allOrders.firstWhere((order) =>
        double.parse(order.price.replaceAll('\$', '').replaceAll(',', '')) ==
        lowestPrice);
  }

  Map<String, int> get statusCounts {
    final Map<String, int> counts = {};
    for (var order in allOrders) {
      counts[order.status] = (counts[order.status] ?? 0) + 1;
    }
    return counts;
  }

  int get returnedOrdersCount {
    return allOrders.where((order) => order.status == "RETURNED").length;
  }

  Future<void> loadOrders({DateTime? startDate, DateTime? endDate}) async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/json/orders.json');
      final List<dynamic> jsonData = jsonDecode(jsonString);
      allOrders.value = jsonData.map((json) => Order.fromJson(json)).toList();
      allOrders.value = allOrders.where((order) {
        final DateTime registeredDate = order.registered;
        final bool isAfterStart = startDate == null ||
            registeredDate.isAfter(startDate) ||
            registeredDate.isAtSameMomentAs(startDate);
        final bool isBeforeEnd = endDate == null ||
            registeredDate.isBefore(endDate) ||
            registeredDate.isAtSameMomentAs(endDate);
        return isAfterStart && isBeforeEnd;
      }).toList();
    } catch (_) {
      rethrow;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onReady() {
    loadOrders();
    super.onReady();
  }
}
