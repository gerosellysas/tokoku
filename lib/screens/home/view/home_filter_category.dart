import 'package:flutter/material.dart';
import 'package:tokoku/res/resources.dart';

class HomeFilterCategory extends StatelessWidget {
  final String? category;
  final void Function()? onTap;

  const HomeFilterCategory({super.key, this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppSize.responsive(40),
        width: AppSize.responsive(180),
        margin: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
        padding: EdgeInsets.only(
          left: AppSize.responsive(20),
          right: AppSize.responsive(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.material,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            category ?? 'All',
            style: AppFonts.reg(),
          ),
        ),
      ),
    );
  }
}

class HomeCategoryButtons extends StatelessWidget {
  final int? itemCount;
  final Widget? Function(BuildContext, int)? itemBuilder;

  const HomeCategoryButtons({super.key, this.itemCount, this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.responsive(40),
      child: ListView.separated(
        itemBuilder: itemBuilder!,
        separatorBuilder: (context, i) {
          return SizedBox(width: AppSize.responsive(0));
        },
        itemCount: itemCount!,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
