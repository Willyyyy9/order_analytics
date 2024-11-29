import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:order_analytics/app/common/widgets/app_button.dart';
import 'package:order_analytics/app/modules/home/controllers/home_controller.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/string_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class OrderFilterDialog extends GetView<HomeController> {
  const OrderFilterDialog({super.key});

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    if (isStartDate && controller.startFilterDate.value != null) {
      initialDate = controller.startFilterDate.value!;
    } else if (!isStartDate && controller.endFilterDate.value != null) {
      initialDate = controller.endFilterDate.value!;
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: isStartDate
          ? DateTime(2000)
          : controller.startFilterDate.value ?? DateTime(2000),
      lastDate: isStartDate
          ? controller.endFilterDate.value ?? DateTime(2101)
          : DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary, // Header background color
              onPrimary: AppColors.white, // Header text color
              onSurface: AppColors.backgroundColor, // Body text color
              surface: Colors.grey[200]!, // Dialog background color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (isStartDate) {
        controller.startFilterDate.value = picked;
      } else {
        controller.endFilterDate.value = picked;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.sizeOf(context).width > 700
            ? MediaQuery.sizeOf(context).width * 0.4
            : MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(AppStrings.selectDateRange,
                style: getBoldStyle(
                    fontSize: 18, color: AppColors.backgroundColor)),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '${AppStrings.startDate}: ',
                  style: getRegularStyle(color: AppColors.backgroundColor),
                ),
                Obx(() => Expanded(
                      child: Text(
                        controller.startFilterDate.value != null
                            ? DateFormat.yMMMd()
                                .format(controller.startFilterDate.value!)
                            : AppStrings.notSelected,
                        style:
                            getRegularStyle(color: AppColors.backgroundColor),
                      ),
                    )),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, true),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '${AppStrings.endDate}: ',
                  style: getRegularStyle(color: AppColors.backgroundColor),
                ),
                Obx(() => Expanded(
                      child: Text(
                        controller.endFilterDate.value != null
                            ? DateFormat.yMMMd()
                                .format(controller.endFilterDate.value!)
                            : AppStrings.notSelected,
                        style:
                            getRegularStyle(color: AppColors.backgroundColor),
                      ),
                    )),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context, false),
                ),
              ],
            ),
            const SizedBox(height: 10),
            AppButton(
              onTap: () {
                if (controller.startFilterDate.value != null &&
                    controller.endFilterDate.value != null &&
                    controller.startFilterDate.value!
                        .isBefore(controller.endFilterDate.value!)) {
                  Get.back();
                  controller.loadOrders(
                    startDate: controller.startFilterDate.value,
                    endDate: controller.endFilterDate.value,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(AppStrings.dateRangeErrorMessage),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              color: AppColors.primary,
              buttonTextStyle: getSemiBoldStyle(color: AppColors.white),
              title: AppStrings.applyRange,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () {
                  controller.startFilterDate.value = null;
                  controller.endFilterDate.value = null;
                  controller.loadOrders(
                    startDate: controller.startFilterDate.value,
                    endDate: controller.endFilterDate.value,
                  );
                  Get.back();
                },
                child: Text(
                  AppStrings.clear,
                  style: getSemiBoldStyle(
                      color: AppColors.backgroundColor, fontSize: 14),
                ))
          ],
        ),
      ),
    );
  }
}
