import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_analytics/app/resources/asset_manager.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(IconAssets.emptyStateIcon),
        Text(
          title,
          textAlign: TextAlign.center,
          style: getBoldStyle(color: AppColors.primary, fontSize: 20),
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: getRegularStyle(color: AppColors.grey, fontSize: 16),
        ),
      ],
    );
  }
}
