import 'package:flutter/material.dart';
import '../core/constant/app_colors.dart';

class TextThemeData {
  static late TextStyle bodySmall;
  static late TextStyle bodyMedium;
  static late TextStyle headlineLarge;
  static late TextStyle headlineMedium;
  static late TextStyle headlineSmall;
  static late TextStyle labelLarge;
  static late TextStyle labelMedium;
  static late TextStyle titleLarge;
  static late TextStyle titleMedium;
  static late TextStyle titleSmall;

  static void initializeTextStyles(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    bodySmall = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.041,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    bodyMedium = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.036,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    headlineLarge = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.075,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
    headlineMedium = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.061,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
    headlineSmall = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.051,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
    labelLarge = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.031,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
    labelMedium = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.031,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    titleLarge = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.046,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
    titleMedium = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.041,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
    titleSmall = TextStyle(
      color: AppColor.black,
      fontSize: screenWidth * 0.036,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
  }
}
