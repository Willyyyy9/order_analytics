import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/resources/asset_manager.dart';
import 'package:order_analytics/app/resources/string_manager.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Semantics(
          label: AppStrings.backButton,
          child: SvgPicture.asset(
            IconAssets.backButton,
            excludeFromSemantics: true,
          ),
        ),
      ),
    );
  }
}
