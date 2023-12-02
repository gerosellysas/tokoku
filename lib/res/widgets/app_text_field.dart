import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/themes/themes.dart';
import 'package:tokoku/res/utils/utils.dart';
import 'package:tokoku/res/widgets/widgets.dart';

class AppTextField extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  // final TextEditingController? controller;
  final bool? autoFocus;
  final bool? obscure;
  final TextInputType? keyboard;
  final TextInputAction? inputAction;
  final int? maxLines;
  final String? prefixIcon;
  final Color? prefixColor;
  final String? hint;
  final String? label;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool? isError;
  final String? errorText;
  final void Function()? onShowPassTap;

  const AppTextField({
    super.key,
    this.height,
    this.width,
    this.radius,
    // this.controller,
    this.autoFocus,
    this.obscure,
    this.keyboard,
    this.inputAction,
    this.maxLines,
    this.prefixIcon,
    this.prefixColor,
    this.hint,
    this.label,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.isError,
    this.errorText,
    this.onShowPassTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: height ?? AppSize.responsive(48),
            width: width ?? AppSize.responsive(312),
            alignment: Alignment.center,
            child: Stack(
              children: [
                TextField(
                  // controller: controller!,
                  autofocus: autoFocus ?? false,
                  obscureText: obscure ?? false,
                  textInputAction: inputAction ?? TextInputAction.next,
                  keyboardType: keyboard ?? TextInputType.name,
                  maxLines: maxLines ?? 1,
                  style: AppFonts.reg(),
                  cursorColor: AppColors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      left: AppSize.responsive(prefixIcon != null ? 48 : 24),
                    ),
                    labelText: label,
                    hintText: hint,
                    counterText: "",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 8),
                      borderSide: const BorderSide(
                          color: AppColors.darkGrey, width: 1.5),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 8),
                      borderSide: const BorderSide(
                          color: AppColors.darkGrey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 8),
                      borderSide:
                          const BorderSide(color: AppColors.black, width: 1.5),
                    ),
                  ),
                  onTap: onTap,
                  onChanged: onChanged,
                  // onFieldSubmitted: onFieldSubmitted,
                  onSubmitted: onFieldSubmitted,
                ),
                prefixIcon != null
                    ? SizedBox(
                        height: AppSize.responsive(48),
                        width: AppSize.responsive(48),
                        child: Center(
                          child: SvgPicture.asset(
                            prefixIcon!,
                            height: AppSize.responsive(24),
                            width: AppSize.responsive(24),
                            colorFilter: ColorFilter.mode(
                              prefixColor ?? AppColors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                obscure != null
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding:
                              EdgeInsets.only(right: AppSize.responsive(12)),
                          child: AppIconButton(
                            icon: obscure!
                                ? AppImages.eyeShow
                                : AppImages.eyeHide,
                            onPressed: onShowPassTap,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          isError! ? SizedBox(height: AppSize.responsive(8)) : const SizedBox(),
          isError!
              ? Container(
                  height: AppSize.responsive(12),
                  width: AppSize.responsive(312),
                  padding: EdgeInsets.only(left: AppSize.responsive(8)),
                  child: Text(
                    errorText!,
                    style: AppFonts.italic(AppColors.red, size: 10),
                  ),
                )
              : const SizedBox(),
          isError! ? SizedBox(height: AppSize.responsive(8)) : const SizedBox(),
        ],
      ),
    );
  }
}
