import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class ProductCard extends StatelessWidget {
  final String? image;
  final String? name;
  final String? price;
  final String? rating;
  final String? review;

  const ProductCard({
    super.key,
    this.image,
    this.name,
    this.price,
    this.rating,
    this.review,
  });

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
                  width: double.maxFinite,
                  decoration: image != null
                      ? BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(image!),
                          ),
                        )
                      : null,
                  child: Visibility(
                    visible: image == null,
                    child: Center(
                      child: Text(
                        'Image error',
                        style: AppFonts.italic(AppColors.darkGrey),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: AppSize.responsive(150),
                  width: double.maxFinite,
                  padding: EdgeInsets.all(AppSize.responsive(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? '-',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: AppFonts.reg(size: 12),
                      ),
                      SizedBox(height: AppSize.responsive(4)),
                      Text(
                        price != null ? 'Price $price' : '-',
                        style: AppFonts.semibold(
                          color: AppColors.black,
                          size: 14,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Visibility(
                        visible: rating != null && review != null,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.rate,
                              height: AppSize.responsive(24),
                              width: AppSize.responsive(24),
                            ),
                            SizedBox(width: AppSize.responsive(4)),
                            Text(
                              rating ?? '-',
                              style: AppFonts.reg(),
                            ),
                            SizedBox(width: AppSize.responsive(8)),
                            Text(
                              '||',
                              style: AppFonts.reg(
                                color: AppColors.black,
                                size: 16,
                              ),
                            ),
                            SizedBox(width: AppSize.responsive(8)),
                            Text(
                              '$review reviews',
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
              onTap: () {
                print("OKE");
              },
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
