import 'package:flutter/material.dart';
import 'package:tokoku/res/resources.dart';

class ProductList extends StatelessWidget {
  final int? itemCount;
  final Widget? Function(BuildContext, int)? itemBuilder;

  const ProductList({
    super.key,
    this.itemCount,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: AppSize.responsive(12),
          top: AppSize.responsive(12),
          right: AppSize.responsive(12),
        ),
        color: AppColors.lightGrey,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisExtent: AppSize.responsive(360),
            crossAxisSpacing: AppSize.responsive(12),
            mainAxisSpacing: AppSize.responsive(12),
          ),
          itemCount: itemCount!,
          itemBuilder: itemBuilder!,
        ),
      ),
    );
  }
}
