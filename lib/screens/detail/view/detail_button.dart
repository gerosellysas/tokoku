import 'package:flutter/material.dart';
import 'package:tokoku/res/resources.dart';

class DetailButton extends StatelessWidget {
  final void Function()? onTap;

  const DetailButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.responsive(72),
      width: AppSize.w,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(vertical: AppSize.responsive(12)),
      child: Center(
        child: AppButton(
          width: AppSize.responsive(352),
          text: 'Add to cart',
          onPressed: onTap,
        ),
      ),
    );
  }
}
