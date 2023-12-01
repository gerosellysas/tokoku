import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/home/view/home_filter_category.dart';
import 'package:tokoku/screens/home/view/home_search.dart';
import 'package:tokoku/screens/search/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        automaticallyImplyLeading: false,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'searchField',
            child: HomeSearch(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
            ),
          ),
          SizedBox(height: AppSize.responsive(24)),
          HomeFilterCategory(
            // category: ,
            onTap: () {},
          ),
          SizedBox(height: AppSize.responsive(24)),
          ProductList(
            itemCount: 20,
            emptyList: 'Errror while loading products',
            itemBuilder: (context, i) => const ProductCard(
// image: [i],
// name: [i],
// price: [i],
// rating: [i],
// review: [i],
                ),
          ),
        ],
      ),
    );
  }
}
