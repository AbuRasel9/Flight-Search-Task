import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enums/font_options.dart';
import 'app_color_schemes.dart';
import 'app_text_themes.dart';

class AppThemeData {
  // --------------------------------------
// Light Theme Data
// --------------------------------------
  static ThemeData lightThemeData(FontOptions fontFamily) => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: CupertinoColors.systemGrey6,
        /*cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          color: AppColorSchemes.lightColorScheme.surface,
          margin: EdgeInsets.zero,
        ),*/
        colorScheme: AppColorSchemes.lightColorScheme,
        textTheme: AppTextThemes.lightTextTheme(fontFamily),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          // backgroundColor: AppColors.scaffoldBackgroundColor,
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColorSchemes.lightColorScheme.onPrimary,
          elevation: 0,
          titleTextStyle: AppTextThemes.lightTextTheme(fontFamily)
              .titleLarge
              ?.copyWith(color: AppColorSchemes.lightColorScheme.onPrimary),
          iconTheme: IconThemeData(
            color: AppColorSchemes.lightColorScheme.onPrimary,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(1),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                return states.contains(WidgetState.disabled)
                    ? AppColorSchemes.lightColorScheme.outline.withOpacity(0.5)
                    : AppColorSchemes.lightColorScheme.primary;
              },
            ),
            foregroundColor: WidgetStatePropertyAll(
                AppColorSchemes.lightColorScheme.onPrimary),
            shadowColor: const WidgetStatePropertyAll(Colors.transparent),
            textStyle: WidgetStatePropertyAll(
              AppTextThemes.lightTextTheme(fontFamily).titleSmall?.copyWith(
                  color: AppColorSchemes.lightColorScheme.onTertiary),
            ),
            overlayColor: WidgetStateProperty.resolveWith(
              (states) {
                return states.contains(WidgetState.pressed)
                    ? AppColorSchemes.lightColorScheme.tertiary.withOpacity(0.2)
                    : null;
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          hintStyle:
              AppTextThemes.lightTextTheme(fontFamily).bodyMedium?.copyWith(
                    color: AppColorSchemes.lightColorScheme.outline,
                  ),
          errorStyle:
              AppTextThemes.lightTextTheme(fontFamily).labelMedium?.copyWith(
                    color: AppColorSchemes.lightColorScheme.error,
                  ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              // color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.7),
              color: AppColorSchemes.lightColorScheme.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              // color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.7),
              color: AppColorSchemes.lightColorScheme.primary,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              // color: AppColorSchemes.lightColorScheme.outline.withOpacity(0.7),
              color: AppColorSchemes.lightColorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide:
                BorderSide(color: AppColorSchemes.lightColorScheme.primary),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: AppColorSchemes.lightColorScheme.primary,
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          labelStyle:
              AppTextThemes.lightTextTheme(fontFamily).bodyMedium?.copyWith(
                    color: AppColorSchemes.lightColorScheme.outline,
                  ),
          prefixIconColor: WidgetStateColor.resolveWith(
            (states) {
              return states.contains(WidgetState.focused)
                  ? AppColorSchemes.lightColorScheme.onSurface
                  : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
            },
          ),
          suffixIconColor: WidgetStateColor.resolveWith(
            (states) {
              return states.contains(WidgetState.focused)
                  ? AppColorSchemes.lightColorScheme.onSurface
                  : AppColorSchemes.lightColorScheme.outline.withOpacity(0.7);
            },
          ),
        ),
      );

// --------------------------------------
// Dark Theme Data
// --------------------------------------
  static ThemeData darkThemeData(FontOptions fontFamily) => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
        /*cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
          color: AppColorSchemes.darkColorScheme.surface,
          margin: EdgeInsets.zero,
        ),*/
        colorScheme: AppColorSchemes.darkColorScheme,
        textTheme: AppTextThemes.darkTextTheme(fontFamily),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkScaffoldBackgroundColor,
          foregroundColor: AppColorSchemes.darkColorScheme.onSurface,
          elevation: 0,
          titleTextStyle:
              AppTextThemes.darkTextTheme(fontFamily).titleLarge?.copyWith(
                    color: AppColorSchemes.lightColorScheme.onSurface,
                  ),
          shape: const LinearBorder(),
          iconTheme: IconThemeData(
            color: AppColorSchemes.darkColorScheme.onSurface,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: const WidgetStatePropertyAll(1),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                return states.contains(WidgetState.disabled)
                    ? AppColorSchemes.darkColorScheme.outline.withOpacity(
                        0.5,
                      )
                    : AppColorSchemes.darkColorScheme.primary;
              },
            ),
            foregroundColor: WidgetStatePropertyAll(
              AppColorSchemes.darkColorScheme.onPrimary,
            ),
            shadowColor: const WidgetStatePropertyAll(
              Colors.transparent,
            ),
            textStyle: WidgetStatePropertyAll(
              AppTextThemes.darkTextTheme(fontFamily).titleMedium?.copyWith(
                    color: AppColorSchemes.darkColorScheme.onPrimary,
                  ),
            ),
            overlayColor: WidgetStateProperty.resolveWith(
              (states) {
                return states.contains(WidgetState.pressed)
                    ? AppColorSchemes.darkColorScheme.tertiary.withOpacity(
                        0.2,
                      )
                    : null;
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          hintStyle:
              AppTextThemes.darkTextTheme(fontFamily).bodyMedium?.copyWith(
                    color: AppColorSchemes.darkColorScheme.outline,
                  ),
          errorStyle:
              AppTextThemes.darkTextTheme(fontFamily).labelMedium?.copyWith(
                    color: AppColorSchemes.darkColorScheme.error,
                  ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: AppColorSchemes.darkColorScheme.outline.withOpacity(
                0.6,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: AppColorSchemes.darkColorScheme.outline.withOpacity(
                0.6,
              ),
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: AppColorSchemes.darkColorScheme.outline.withOpacity(
                0.6,
              ),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: AppColorSchemes.darkColorScheme.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: AppColorSchemes.darkColorScheme.error,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          labelStyle:
              AppTextThemes.darkTextTheme(fontFamily).bodyMedium?.copyWith(
                    color: AppColorSchemes.lightColorScheme.outline,
                  ),
        ),
      );
}
