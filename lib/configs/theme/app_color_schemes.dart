import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF00135D);
  static const Color secondaryColor = Color(0xFFF76425);
  static const Color tertiaryColor = Color(0xFF059628);

  // static const Color hintColor = Color(0xFF868b8e);
  static const Color hintColor = Colors.black;
  static const Color errorColor = Color(0xFFcc3300);
  static const Color successColor = Color(0xFF339900);
  static const Color scaffoldBackgroundColor = CupertinoColors.systemGrey6;
  static const Color darkScaffoldBackgroundColor = Colors.black45;
}

class AppColorSchemes {
  // --------------------------------------
  // Light Color scheme
  // --------------------------------------
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.errorColor,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
    outline: AppColors.hintColor,
    tertiary: AppColors.tertiaryColor,
    onTertiary: Colors.white,
  );

  // --------------------------------------
  // Dark Color scheme
  // --------------------------------------
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primaryColor,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryColor,
    onSecondary: Colors.white,
    error: AppColors.errorColor,
    onError: Colors.white,
    surface: Colors.black,
    onSurface: Colors.white,
    outline: AppColors.hintColor,
    tertiary: AppColors.tertiaryColor,
    onTertiary: Colors.white,
  );
}
