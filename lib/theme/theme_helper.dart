import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../core/constant/app_colors.dart';
import '../core/utils/pref_utils.dart';
import '../core/utils/size_utils.dart';

ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  //final _appTheme = PrefUtils().getThemeData();

  // A map of custom color themes supported by the app
  // final Map<String, LightCodeColors> _supportedCustomColor = {
  //   'lightCode': LightCodeColors(),
  // };

  // final Map<String, ColorScheme> _supportedColorScheme = {
  //   'lightCode': ColorSchemes.primaryColorScheme,
  // };

  /// Change the theme of the app theme to [newTheme]

  void changeTheme(String newTheme) {
    PrefUtils().setThemeData(newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the lightCode colors for the current theme.


  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme = ColorSchemes.primaryColorScheme;
    // _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColor.white,
      fontFamily: 'PlusJakartaSans',
      appBarTheme: AppBarTheme(
        backgroundColor:Color(0XFF0E1026),
      ),
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      brightness: Brightness.dark,
      primaryColor:  const Color(0XFF0E1026),
      primarySwatch: Colors.brown,
      textTheme: TextThemes.textTheme(colorScheme),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: colorScheme.primaryContainer.withOpacity(0.1),
          elevation: 4,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.transparent,
          side: BorderSide(
            color: colorScheme.primary,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return AppColor.black.withOpacity(0.4);
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return Colors.transparent;
        }),
        side: BorderSide(
          color: AppColor.black,
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),




    );
  }

  /// Returns the primary colors for the current theme.

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.041,//16
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.036,//14
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.031, //12
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.075, //30
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.061, //24
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.051,//20
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.031, //12
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.031, //12
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.046,//18
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.041, //16
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: AppColor.black,
          fontSize: mediaQueryData.size.width * 0.036, //14
          fontFamily: 'PlusJakartaSans',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static const primaryColorScheme = ColorScheme.dark(
    // Primary colors
    primary: Color(0XFF0E1026),

    inversePrimary: Color(0XFFBC976E),
    secondary: Color(0XFF1B1D35),
    


    primaryContainer: Color(0XFFE8E8E8),
    secondaryContainer:Color(0XFFAB7259),

    // Error colors
    errorContainer: Color(0X2600AA5B),
    onError: Color(0XFFD1D1D6),

    // On colors(text colors)
    onPrimary: Color(0XFF31334B),

    background: Color(0XFF0E1026),
  );
}


