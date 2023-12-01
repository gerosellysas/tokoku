import 'package:flutter/material.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/detail/view/detail_button.dart';
import 'package:tokoku/screens/detail/view/detail_product.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leadingWidth: AppSize.responsive(48),
        leading: AppIconButton(
          icon: AppImages.back,
          color: AppColors.material,
          onPressed: () {},
        ),
        actions: [
          AppIconButton(
            icon: AppImages.cart,
            color: AppColors.material,
            onPressed: () {},
          ),
          AppIconButton(
            icon: AppImages.profile,
            color: AppColors.material,
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const DetailProduct(),
          DetailButton(onTap: () {}),
        ],
      ),
    );
  }
}
