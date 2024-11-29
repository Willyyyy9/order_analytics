import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

class CircleProfileAvatar extends StatelessWidget {
  final String text;
  final double size;
  final double? fontSize;

  const CircleProfileAvatar(
      {super.key, required this.text, required this.size, this.fontSize});

  @override
  Widget build(BuildContext context) {
    // Check if the text is not empty and get the first letter
    String initial = text.isNotEmpty ? text[0].toUpperCase() : '';

    return Container(
      width: size, // Adjust size as needed
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFD9D9D9), // Background color of the circle
      ),
      child: Center(
        child: Text(
          initial,
          style: getSemiBoldStyle(
            fontSize: fontSize ?? 14, // Adjust text size as needed
            color: AppColors.primary, // Text color
          ),
        ),
      ),
    );
  }
}
