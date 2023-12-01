import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class HomeSearch extends StatelessWidget {
  final void Function()? onTap;

  const HomeSearch({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: AppSize.responsive(48),
          width: AppSize.responsive(352),
          padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.grey, width: 1.5),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppImages.search,
                height: AppSize.responsive(24),
                width: AppSize.responsive(24),
                colorFilter: const ColorFilter.mode(
                  AppColors.darkGrey,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: AppSize.responsive(12)),
              Material(
                color: Colors.transparent,
                child: Text('Search on tokoku',
                    style: AppFonts.italic(AppColors.darkGrey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
