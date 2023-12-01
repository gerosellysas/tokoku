import 'package:flutter/material.dart';
import 'package:tokoku/res/themes/app_colors.dart';
import 'package:tokoku/res/themes/app_fonts.dart';
import 'package:tokoku/res/utils/utils.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.material),
    primarySwatch: AppColors.material,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.darkGrey, width: 1.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.darkGrey, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.black, width: 1.5),
      ),
      alignLabelWithHint: true,
      hintStyle: AppFonts.italic(AppColors.darkGrey),
      labelStyle: AppFonts.italic(AppColors.darkGrey),
      floatingLabelStyle: AppFonts.italic(AppColors.black),
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSize.responsive(12),
        horizontal: AppSize.responsive(16),
      ),
    ),
  );
}
