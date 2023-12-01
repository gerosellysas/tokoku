import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_repo/shop_repo.dart';
import 'package:tokoku/res/resources.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final void Function()? onTap;

  const ProductCard({super.key, this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      elevation: 2.0,
      shadowColor: AppColors.lightGrey.withOpacity(0.64),
      margin: EdgeInsets.zero,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.responsive(8)),
              border: Border.all(color: AppColors.grey, width: 0.5),
            ),
            child: Column(
              children: [
                Container(
                  height: AppSize.responsive(200),
                  margin: EdgeInsets.only(
                    left: AppSize.responsive(12),
                    top: AppSize.responsive(12),
                    right: AppSize.responsive(12),
                  ),
                  width: double.maxFinite,
                  decoration: product!.image != null
                      ? BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product!.image!),
                          ),
                        )
                      : null,
                  child: Visibility(
                    visible: product!.image == null,
                    child: Center(
                      child: Text(
                        'Image error',
                        style: AppFonts.italic(AppColors.darkGrey),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: AppSize.responsive(140),
                  width: double.maxFinite,
                  padding: EdgeInsets.all(AppSize.responsive(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.title ?? '-',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: AppFonts.reg(size: 12),
                      ),
                      SizedBox(height: AppSize.responsive(4)),
                      Text(
                        product!.price != null
                            ? 'Price ${product!.price}'
                            : '-',
                        style: AppFonts.semibold(
                          color: AppColors.black,
                          size: 14,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Visibility(
                        visible: product!.rating!.rate != null &&
                            product!.rating!.count != null,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.end,
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
                              style: AppFonts.reg(),
                            ),
                            SizedBox(width: AppSize.responsive(4)),
                            Text(
                              '${product!.rating!.count} reviews',
                              style: AppFonts.reg(
                                color: AppColors.darkGrey,
                                size: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppSize.responsive(8)),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(AppSize.responsive(8)),
              splashColor: AppColors.lightGrey.withOpacity(0.32),
              highlightColor: AppColors.lightGrey.withOpacity(0.32),
              child: SizedBox(
                height: AppSize.responsive(360),
                width: double.maxFinite,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
