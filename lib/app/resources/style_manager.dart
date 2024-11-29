import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/font_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color,
    double? height, FontStyle? fontStyle, TextDecoration? textDecoration) {
  return TextStyle(
      fontFamily: FontConstant.fontFamily,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: textDecoration,
      height: height,
      fontStyle: fontStyle);
}

// Regular Style
TextStyle getRegularStyle(
    {double fontSize = 12,
    required Color color,
    double? height,
    TextDecoration? textDecoration,
    FontStyle? fontStyle}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color, height,
      fontStyle, textDecoration);
}

// Medium Style
TextStyle getMediumStyle(
    {double fontSize = 12,
    required Color color,
    double? height,
    TextDecoration? textDecoration,
    FontStyle? fontStyle}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color, height,
      fontStyle, textDecoration);
}

// Light Style
TextStyle getLightStyle(
    {double fontSize = 12,
    required Color color,
    double? height,
    TextDecoration? textDecoration,
    FontStyle? fontStyle}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color, height,
      fontStyle, textDecoration);
}

// Bold Style
TextStyle getSemiBoldStyle(
    {double fontSize = 12,
    required Color color,
    double? height,
    TextDecoration? textDecoration,
    FontStyle? fontStyle}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color, height,
      fontStyle, textDecoration);
}

// Bold Style
TextStyle getBoldStyle(
    {double fontSize = 12,
    required Color color,
    double? height,
    TextDecoration? textDecoration,
    FontStyle? fontStyle}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color, height,
      fontStyle, textDecoration);
}

// Regular Style
