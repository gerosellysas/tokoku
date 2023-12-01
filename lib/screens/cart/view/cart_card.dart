import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.responsive(124),
      padding: EdgeInsets.all(AppSize.responsive(12)),
      color: AppColors.white,
      child: Row(
        children: [
          Container(
            height: AppSize.responsive(100),
            width: AppSize.responsive(100),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(AppSize.responsive(12)),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg'),
              ),
            ),
          ),
          SizedBox(width: AppSize.responsive(12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: AppSize.responsive(256),
                child: Text(
                  'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor cccc (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppFonts.reg(
                    color: AppColors.darkGrey,
                    size: 12,
                  ),
                ),
              ),
              SizedBox(height: AppSize.responsive(4)),
              Text('Price 24', style: AppFonts.semibold()),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: AppSize.responsive(32),
                width: AppSize.responsive(256),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: AppSize.responsive(32),
                      width: AppSize.responsive(120),
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.responsive(8)),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey, width: 1),
                        borderRadius:
                            BorderRadius.circular(AppSize.responsive(8)),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.remove,
                            height: AppSize.responsive(20),
                            width: AppSize.responsive(20),
                            colorFilter: const ColorFilter.mode(
                                AppColors.material, BlendMode.srcIn),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            width: AppSize.responsive(40),
                            alignment: Alignment.center,
                            child: Text(
                              '10000000',
                              maxLines: 1,
                              style: AppFonts.reg(size: 12),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          SvgPicture.asset(
                            AppImages.add,
                            height: AppSize.responsive(20),
                            width: AppSize.responsive(20),
                            colorFilter: const ColorFilter.mode(
                                AppColors.material, BlendMode.srcIn),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AppImages.delete,
                        height: AppSize.responsive(24),
                        width: AppSize.responsive(24),
                        colorFilter: const ColorFilter.mode(
                            AppColors.darkGrey, BlendMode.srcIn),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
