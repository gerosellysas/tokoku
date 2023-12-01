import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/themes/themes.dart';
import 'package:tokoku/res/utils/utils.dart';

class AppIconButton extends StatelessWidget {
  final String? icon;
  final Color? color;
  final void Function()? onPressed;

  const AppIconButton({
    super.key,
    this.icon,
    this.color,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      type: MaterialType.circle,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSize.responsive(48)),
        highlightColor: AppColors.primary.withOpacity(0.12),
        splashColor: AppColors.primary.withOpacity(0.12),
        child: Container(
          height: AppSize.responsive(48),
          width: AppSize.responsive(48),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon!,
              height: AppSize.responsive(24),
              width: AppSize.responsive(24),
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
