import 'package:flutter/material.dart';
import 'package:tokoku/res/themes/themes.dart';
import 'package:tokoku/res/utils/utils.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final Color? textColor;
  final String? text;
  final void Function()? onPressed;

  const AppButton({
    super.key,
    this.height,
    this.width,
    this.color,
    this.textColor,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? AppSize.responsive(48),
      minWidth: width ?? AppSize.responsive(312),
      color: color ?? AppColors.material,
      disabledColor: color ?? AppColors.material,
      highlightColor: AppColors.primary.withOpacity(0.32),
      splashColor: AppColors.primary.withOpacity(0.32),
      elevation: 0.0,
      highlightElevation: 0.0,
      onPressed: onPressed,
      child: Text(
        text!,
        style: AppFonts.semibold(color: textColor ?? AppColors.black),
      ),
    );
  }
}
