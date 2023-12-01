import 'package:flutter/material.dart';
import 'package:tokoku/res/themes/themes.dart';
import 'package:tokoku/res/utils/utils.dart';

class AppTextField extends StatelessWidget {
  final double? height;
  final double? width;
  // final TextEditingController? controller;
  final bool? readOnly;
  final bool? obscure;
  final TextInputType? keyboard;
  final TextInputAction? inputAction;
  final int? maxLines;
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
    // this.controller,
    this.readOnly,
    this.obscure,
    this.keyboard,
    this.inputAction,
    this.maxLines,
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
    return Column(
      children: [
        Container(
          height: height ?? AppSize.responsive(48),
          width: width ?? AppSize.responsive(312),
          alignment: Alignment.center,
          child: Stack(
            children: [
              TextFormField(
                // controller: controller!,
                readOnly: readOnly ?? false,
                obscureText: obscure ?? false,
                textInputAction: inputAction ?? TextInputAction.next,
                keyboardType: keyboard ?? TextInputType.name,
                maxLines: maxLines ?? 1,
                style: AppFonts.reg(),
                cursorColor: AppColors.black,
                decoration: InputDecoration(
                  labelText: label,
                  hintText: hint,
                  counterText: "",
                ),
                onTap: onTap,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
              ),
              obscure != null
                  ? GestureDetector(
                      behavior: HitTestBehavior.deferToChild,
                      onTap: onShowPassTap,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: AppSize.responsive(12)),
                        child: Text(
                          obscure! ? "SHOW" : "HIDE",
                          style: AppFonts.reg(),
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
    );
  }
}
