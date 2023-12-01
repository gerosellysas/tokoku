import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({super.key});
  // final Product? product;

  // const DetailProduct({super.key, this.product});

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg'),
              ),
            ),
          ),
          SizedBox(height: AppSize.responsive(24)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
            child: Text(
              'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor cccc (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ',
              style: AppFonts.reg(size: 12),
            ),
          ),
          SizedBox(height: AppSize.responsive(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
            child: Text(
              'Price 39',
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
                  '4.7',
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
                  '896 reviews',
                  style: AppFonts.reg(
                    color: AppColors.darkGrey,
                    size: 12,
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    AppImages.favoriteOff,
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
              'Note:The Jackets is US standard size, Please choose size as your usual wear Material: 100% Polyester; Detachable Liner Fabric: Warm Fleece. Detachable Functional Liner: Skin Friendly, Lightweigt and Warm.Stand Collar Liner jacket, keep you warm in cold weather. Zippered Pockets: 2 Zippered Hand Pockets, 2 Zippered Pockets on Chest (enough to keep cards or keys)and 1 Hidden Pocket Inside.Zippered Hand Pockets and Hidden Pocket keep your things secure. Humanized Design: Adjustable and Detachable Hood and Adjustable cuff to prevent the wind and water,for a comfortable fit. 3 in 1 Detachable Design provide more convenience, you can separate the coat and inner as needed, or wear it together. It is suitable for different season and help you adapt to different climates',
              style: AppFonts.reg(),
            ),
          ),
          SizedBox(height: AppSize.responsive(72)),
        ],
      ),
    );
  }
}
