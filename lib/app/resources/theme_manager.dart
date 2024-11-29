import 'package:flutter/material.dart';
import 'package:order_analytics/app/resources/color_manager.dart';
import 'package:order_analytics/app/resources/style_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //Colors
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.lightPrimary,
    primaryColorDark: AppColors.darkPrimary,
    disabledColor: AppColors.grey1,
    splashColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.backgroundColor,

    //Cards Theme
    cardTheme: CardTheme(
      color: AppColors.white,
      shadowColor: AppColors.grey,
      elevation: 4,
    ),

    //AppBar Theme
    appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        color: AppColors.transparent,
        elevation: 0,
        shadowColor: AppColors.transparent,
        titleTextStyle: getRegularStyle(
          color: AppColors.black,
          fontSize: 16,
        )),

    //Button Theme
    buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: AppColors.grey1,
        buttonColor: AppColors.primary,
        splashColor: AppColors.lightPrimary),

    //Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getRegularStyle(
              color: AppColors.white,
              fontSize: 16,
            ),
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),

    //Text Theme
    textTheme: TextTheme(
      displayLarge: getBoldStyle(color: AppColors.darkGrey, fontSize: 16),
      headlineMedium: getRegularStyle(color: AppColors.darkGrey, fontSize: 14),
      titleMedium: getMediumStyle(color: AppColors.black, fontSize: 16),
      bodySmall: getRegularStyle(
        color: AppColors.grey1,
      ),
      bodyLarge: getRegularStyle(color: AppColors.grey),
    ),

    dialogTheme: DialogTheme(
        backgroundColor: AppColors.white,
        titleTextStyle: getBoldStyle(color: AppColors.black, fontSize: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentTextStyle: getRegularStyle(color: AppColors.black),
        alignment: Alignment.center),

    //Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(8),
      hintStyle: getRegularStyle(
        color: AppColors.darkPrimary,
        fontSize: 14,
      ),
      labelStyle: getMediumStyle(
        color: AppColors.darkPrimary,
        fontSize: 14,
      ),
      errorStyle: getRegularStyle(color: AppColors.error, height: 1),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
    ),
  );
}
