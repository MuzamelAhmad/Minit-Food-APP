import 'package:flutter/material.dart';
import 'package:mini_food_app/SRC/Data/Resources/colors/light_colors.dart';

class LightTheme {
  static ThemeData getTheme(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final scaleFactor = _getScaleFactor(width);
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        brightness: Brightness.light,
        primary: LightThemeColors.primaryColor,
        onPrimary: LightThemeColors.onPrimaryColor,
        secondary: LightThemeColors.secondaryColor,
        onSecondary: LightThemeColors.subtitleTextColor,
        surfaceTint: LightThemeColors.formFieldTextColor,
        error: LightThemeColors.errorColor,
        onError: LightThemeColors.errorContainerColor,
        surface: LightThemeColors.surfaceColor,
        onSurface: LightThemeColors.bodyTextColor,
      ),
      textTheme: TextTheme(
        //ToolTip/Badge/Chip
        bodySmall: TextStyle(
          fontFamily: 'Poppins-Regular',
          color: LightThemeColors.bodyTextColor,
          fontSize: 12 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        //Caption
        bodyMedium: TextStyle(
          fontFamily: 'Poppins-Medium',
          color: LightThemeColors.subtitleTextColor,
          fontSize: 14 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        //Body Regular
        bodyLarge: TextStyle(
          fontFamily: 'Poppins-Regular',
          color: LightThemeColors.bodyTextColor,
          fontSize: 16 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        //Heading 4
        headlineSmall: TextStyle(
          fontFamily: 'Poppins-Medium',
          color: LightThemeColors.bodyTextColor,
          fontSize: 20 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        //Heading 3
        headlineMedium: TextStyle(
          fontFamily: 'Poppins-SmiBold',
          color: LightThemeColors.bodyTextColor,
          fontSize: 24 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        // Heading 2
        headlineLarge: TextStyle(
          fontFamily: 'Poppins-SmiBold',
          color: LightThemeColors.bodyTextColor,
          fontSize: 36 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        // Heading 1
        displayMedium: TextStyle(
          fontFamily: 'Poppins-SmiBold',
          color: LightThemeColors.bodyTextColor,
          fontSize: 48 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),

        //Body - Bold
        labelMedium: TextStyle(
          fontFamily: 'Poppins-Bold',
          color: LightThemeColors.bodyTextColor,
          fontSize: 16 * scaleFactor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      iconTheme: IconThemeData(
        size: 24 * scaleFactor,
        color: ColorScheme.light().onSurface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,

        // fillColor: lightTheme.colorScheme.secondary,
        // contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        // focusColor: lightTheme.colorScheme.secondary,
      ),
    );
  }

  static double _getScaleFactor(double width) {
    if (width < 360) return 0.8; // Very small phones
    if (width < 400) return 0.9; // Small phones
    if (width < 480) return 1.0; // Standard phones (base size)
    if (width < 600) return 1.1; // Large phones
    if (width < 768) return 1.2; // Small tablets
    if (width < 1024) return 1.3; // Tablets
    return 1.4;
  } // Large screens/desktop
}
