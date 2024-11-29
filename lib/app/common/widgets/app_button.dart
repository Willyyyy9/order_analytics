import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.height,
      this.color,
      this.borderRadius,
      this.fontSize,
      this.suffixIcon,
      this.prefixIcon,
      this.suffixIconColor,
      this.prefixIconColor,
      this.buttonTextStyle,
      this.padding,
      this.width});
  final String title;
  final Function onTap;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final double? fontSize;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final TextStyle? buttonTextStyle;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(0),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8))),
            backgroundColor:
                WidgetStateProperty.all(color ?? AppColors.accent)),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Icon(
                  prefixIcon,
                  color: prefixIconColor ?? AppColors.white,
                  size: 20,
                ),
              if (prefixIcon != null)
                const SizedBox(
                  width: 10,
                ),
              Text(
                title,
                semanticsLabel: title,
                maxLines: 1,
                style: buttonTextStyle ??
                    getSemiBoldStyle(
                        fontSize: fontSize ?? 15, color: AppColors.primary),
              ),
              if (suffixIcon != null)
                const SizedBox(
                  width: 10,
                ),
              if (suffixIcon != null)
                Icon(
                  suffixIcon,
                  color: suffixIconColor ?? AppColors.white,
                  size: 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
