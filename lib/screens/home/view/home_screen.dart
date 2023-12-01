import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0.0,
        leadingWidth: AppSize.responsive(124),
        leading: Padding(
          padding: EdgeInsets.only(left: AppSize.responsive(12)),
          child: SvgPicture.asset(
            AppImages.logoSmall,
            height: AppSize.responsive(36),
            width: AppSize.responsive(112),
          ),
        ),
        actions: [
          AppIconButton(
            icon: AppImages.cart,
            onPressed: () {},
          ),
          AppIconButton(
            icon: AppImages.profile,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  height: AppSize.responsive(48),
                  width: AppSize.responsive(352),
                  padding:
                      EdgeInsets.symmetric(horizontal: AppSize.responsive(12)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(8),
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
                      Text(
                        'Search on tokoku',
                        style: AppFonts.italic(AppColors.darkGrey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: AppSize.responsive(24)),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: AppSize.responsive(40),
                width: AppSize.responsive(180),
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
                      'women\'s clothing',
                      style: AppFonts.reg(color: AppColors.black),
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
            SizedBox(height: AppSize.responsive(24)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisExtent: AppSize.responsive(360),
                  crossAxisSpacing: AppSize.responsive(12),
                  mainAxisSpacing: AppSize.responsive(12),
                ),
                itemCount: 12,
                itemBuilder: (context, i) {
                  return Card(
                    color: AppColors.white,
                    elevation: 2.0,
                    shadowColor: AppColors.lightGrey.withOpacity(0.64),
                    margin: EdgeInsets.zero,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppSize.responsive(8)),
                            border:
                                Border.all(color: AppColors.grey, width: 0.5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: AppSize.responsive(200),
                                width: double.maxFinite,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
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
                                      'Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor (LC49HG90DMNXZA) – Super Ultrawide Screen QLED ',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: AppFonts.reg(
                                        color: AppColors.black,
                                        size: 12,
                                      ),
                                    ),
                                    SizedBox(height: AppSize.responsive(4)),
                                    Text(
                                      'Price 168',
                                      style: AppFonts.semibold(
                                        color: AppColors.black,
                                        size: 14,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Row(
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.end,
                                      children: [
                                        SvgPicture.asset(
                                          AppImages.rate,
                                          height: AppSize.responsive(24),
                                          width: AppSize.responsive(24),
                                        ),
                                        SizedBox(width: AppSize.responsive(4)),
                                        Text(
                                          '4.9',
                                          style: AppFonts.reg(
                                            color: AppColors.black,
                                            size: 14,
                                          ),
                                        ),
                                        const Expanded(child: SizedBox()),
                                        Text(
                                          '885 reviews',
                                          style: AppFonts.reg(
                                            color: AppColors.darkGrey,
                                            size: 10,
                                            // ).merge(
                                            //   const TextStyle(
                                            //     decoration:
                                            //         TextDecoration.underline,
                                            //     decorationColor:
                                            //         AppColors.darkGrey,
                                            //     decorationThickness: 0.5,
                                            //   ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // SizedBox(height: AppSize.responsive(4)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          borderRadius:
                              BorderRadius.circular(AppSize.responsive(8)),
                          child: InkWell(
                            onTap: () {
                              print("OKE");
                            },
                            borderRadius:
                                BorderRadius.circular(AppSize.responsive(8)),
                            splashColor: AppColors.lightGrey.withOpacity(0.32),
                            highlightColor:
                                AppColors.lightGrey.withOpacity(0.32),
                            child: SizedBox(
                              height: AppSize.responsive(360),
                              width: double.maxFinite,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
