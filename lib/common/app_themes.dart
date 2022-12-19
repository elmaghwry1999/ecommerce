import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_text_styles.dart';

class AppThemes {
  //static final ThemeData appTheme = ThemeData()
  AppThemes._();

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.lightBackgroundColor,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.lightPrimaryColor,
        onPrimary: AppColors.lightOnPrimaryColor,
        secondary: AppColors.lightSecondaryColor,
        onSecondary: AppColors.lightOnSecondaryColor,
        error: AppColors.lightErrorColor,
        onError: AppColors.lightOnErrorColor,
        background: AppColors.lightBackgroundColor,
        onBackground: AppColors.lightOnBackgroundColor,
        surface: AppColors.lightSurfaceColor,
        onSurface: AppColors.lightOnSurfaceColor,
      ),
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.lightPrimaryVariantColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: AppColors.lightPrimaryColor,
        elevation: 2,
        centerTitle: true,
        foregroundColor: AppColors.lightOnPrimaryColor,
        actionsIconTheme:
            IconThemeData(color: AppColors.lightActionIconColor, size: 20),
        titleTextStyle: TextStyle(
            color: AppColors.lightOnPrimaryColor,
            fontFamily: AppFontsConstants.dmSansFontFamily,
            fontSize: AppFontSize.titleMedium,
            fontWeight: AppFontWeight.medium),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: AppColors.lightElevatedButtonBackgroundColor,
          textStyle: const TextStyle(
              color: AppColors.lightOnSecondaryColor,
              fontFamily: AppFontsConstants.dmSansFontFamily,
              fontSize: AppFontSize.buttonTextMedium,
              fontWeight: AppFontWeight.medium),
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 4,
        color: AppColors.lightCardColor,
      ),
      platform: TargetPlatform.android,
      textTheme: AppTextStyle.lightTextTheme);
}
