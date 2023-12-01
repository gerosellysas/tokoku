import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_repo/shop_repo.dart';
import 'package:tokoku/res/resources.dart';

class DetailProduct extends StatelessWidget {
  final Product? product;
  final bool? favorite;
  final void Function()? onFavoriteTap;

  const DetailProduct({
    super.key,
    this.product,
    this.favorite,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppSize.responsive(500),
            width: AppSize.w,
            margin: EdgeInsets.only(top: AppSize.responsive(48)),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product!.image!),
              ),
            ),
          ),
          SizedBox(height: AppSize.responsive(24)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
            child: Text(
              product!.title!,
              style: AppFonts.reg(size: 12),
            ),
          ),
          SizedBox(height: AppSize.responsive(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
            child: Text(
              'Price ${product!.price}',
              style: AppFonts.bold(
                color: AppColors.material,
                size: 20,
              ),
            ),
          ),
          SizedBox(height: AppSize.responsive(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppImages.rate,
                  height: AppSize.responsive(24),
                  width: AppSize.responsive(24),
                ),
                SizedBox(width: AppSize.responsive(4)),
                Text(
                  '${product!.rating!.rate}',
                  style: AppFonts.reg(),
                ),
                SizedBox(width: AppSize.responsive(4)),
                Text(
                  '|',
                  style: AppFonts.reg(
                    color: AppColors.black,
                    size: 16,
                  ),
                ),
                SizedBox(width: AppSize.responsive(4)),
                Text(
                  '${product!.rating!.count} reviews',
                  style: AppFonts.reg(
                    color: AppColors.darkGrey,
                    size: 12,
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: onFavoriteTap,
                  child: SvgPicture.asset(
                    favorite! ? AppImages.favoriteOn : AppImages.favoriteOff,
                    height: AppSize.responsive(24),
                    width: AppSize.responsive(24),
                  ),
                ),
                SizedBox(width: AppSize.responsive(8)),
              ],
            ),
          ),
          SizedBox(height: AppSize.responsive(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
            child: Text(
              '${product!.description}',
              style: AppFonts.reg(),
            ),
          ),
          SizedBox(height: AppSize.responsive(72)),
        ],
      ),
    );
  }
}
