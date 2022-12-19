import 'package:flutter/material.dart';

import 'app_fonts.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextTheme lightTextTheme = const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.headlineLarge,
      fontWeight: AppFontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.headlineMedium,
      fontWeight: AppFontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.bodyLarge,
      fontWeight: AppFontWeight.medium,
    ),
    bodySmall: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.bodySmall,
      fontWeight: AppFontWeight.medium,
    ),
    labelLarge: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.labelLarge,
      fontWeight: AppFontWeight.regular,
    ),
    labelMedium: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.labelMedium,
      fontWeight: AppFontWeight.medium,
    ),
    labelSmall: TextStyle(
      fontFamily: AppFontsConstants.dmSansFontFamily,
      fontSize: AppFontSize.labelSmall,
      fontWeight: AppFontWeight.regular,
    ),
  );
}
