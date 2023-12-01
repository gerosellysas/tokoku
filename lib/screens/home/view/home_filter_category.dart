import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class HomeFilterCategory extends StatelessWidget {
  final String? category;
  final void Function()? onTap;

  const HomeFilterCategory({super.key, this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
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
          child: Row(
            children: [
              Text(
                category ?? 'All',
                style: AppFonts.reg(),
              ),
              const Expanded(child: SizedBox()),
              SvgPicture.asset(
                AppImages.dropdown,
                height: AppSize.responsive(24),
                width: AppSize.responsive(24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
