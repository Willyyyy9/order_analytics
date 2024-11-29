import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/color_manager.dart';

class AppDivider extends StatelessWidget implements PreferredSizeWidget {
  const AppDivider({super.key, this.horizontalMargin = 12});
  final double horizontalMargin;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
          child: Divider(
            height: 1,
            color: AppColors.dividerColor,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(1);
}
