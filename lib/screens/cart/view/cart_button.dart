import 'package:flutter/material.dart';
import 'package:tokoku/res/resources.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      elevation: 16.0,
      shadowColor: AppColors.lightGrey,
      child: Container(
        height: AppSize.responsive(110),
        width: AppSize.w,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.responsive(24),
          vertical: AppSize.responsive(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Total',
                  style: AppFonts.semibold(color: AppColors.darkGrey),
                ),
                const Expanded(child: SizedBox()),
                Text('560', style: AppFonts.semibold()),
              ],
            ),
            const Expanded(child: SizedBox()),
            AppButton(
              width: AppSize.responsive(352),
              text: 'Proceed to payment',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
