import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:order_analytics/app/resources/asset_manager.dart';
import 'package:order_analytics/app/resources/string_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        builder: (controller) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 2),
                  builder: (context, double opacity, child) {
                    return Transform.translate(
                      offset: Offset(0, (1 - opacity) * 50),
                      child: Opacity(
                        opacity: opacity,
                        child: SvgPicture.asset(
                          IconAssets.flapKap,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0.0, end: 1.0),
                  duration: const Duration(seconds: 2),
                  builder: (context, double opacity, child) {
                    return Transform.translate(
                      offset: Offset(0, (1 - opacity) * 30),
                      child: Opacity(
                        opacity: opacity,
                        child: Text(
                          AppStrings.orderAnalytics,
                          style: getBoldStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
