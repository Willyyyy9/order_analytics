import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/color_manager.dart';

class AppCircleIconButton extends StatelessWidget {
  const AppCircleIconButton(
      {super.key,
      required this.onPressed,
      this.padding,
      this.backgroundColor,
      this.splashColor,
      this.iconColor,
      required this.icon,
      this.size});
  final Function() onPressed;
  final double? padding;
  final Color? backgroundColor;
  final Color? splashColor;
  final Color? iconColor;
  final IconData icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: EdgeInsets.all(padding ?? 2),
        backgroundColor: backgroundColor ?? AppColors.primary,
        foregroundColor: splashColor ?? AppColors.white,
      ),
      child: Icon(icon, size: size, color: iconColor ?? AppColors.lightBlack),
    );
  }
}
