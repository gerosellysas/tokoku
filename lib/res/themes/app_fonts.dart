import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tokoku/res/themes/app_colors.dart';

class AppFonts {
  static TextStyle reg({Color? color, double? size}) => GoogleFonts.inter(
        color: color ?? AppColors.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle italic(Color color, {double? size, FontWeight? weight}) =>
      GoogleFonts.inter(
        color: color,
        fontSize: size ?? 14,
        fontStyle: FontStyle.italic,
        fontWeight: weight ?? FontWeight.w400,
      );

  static TextStyle semibold({Color? color, double? size}) => GoogleFonts.inter(
        color: color ?? AppColors.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle bold({Color? color, double? size}) => GoogleFonts.inter(
        color: color ?? AppColors.black,
        fontSize: size ?? 14,
        fontWeight: FontWeight.w700,
      );
}
