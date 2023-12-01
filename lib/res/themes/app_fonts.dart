import 'package:flutter/material.dart';
import 'package:tokoku/res/themes/app_colors.dart';

class AppFonts {
  static TextStyle reg({Color? color, double? size}) => TextStyle(
        color: color ?? AppColors.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle italic(Color color, {double? size, FontWeight? weight}) =>
      TextStyle(
        color: color,
        fontSize: size ?? 14,
        fontStyle: FontStyle.italic,
        fontWeight: weight ?? FontWeight.w400,
      );

  static TextStyle semibold({Color? color, double? size}) => TextStyle(
        color: color ?? AppColors.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w600,
      );
}
