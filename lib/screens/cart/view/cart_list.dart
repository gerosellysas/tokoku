import 'package:flutter/material.dart';
import 'package:tokoku/res/resources.dart';

class CartList extends StatelessWidget {
  final int? itemCount;
  final Widget? Function(BuildContext, int)? itemBuilder;

  const CartList({super.key, this.itemCount, this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return itemCount == 0 || itemCount == null
        ? Center(
            child: Text(
              'No products added to cart',
              style: AppFonts.italic(AppColors.darkGrey),
            ),
          )
        : Container(
            color: AppColors.lightGrey,
            child: ListView.separated(
              itemCount: itemCount!,
              itemBuilder: itemBuilder!,
              separatorBuilder: (context, i) {
                return SizedBox(height: AppSize.responsive(12));
              },
            ),
          );
  }
}
