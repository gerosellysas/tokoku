import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokoku/res/resources.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: 'imageLogo',
          child: SvgPicture.asset(
            AppImages.logo,
            height: AppSize.responsive(178),
            width: AppSize.responsive(108),
          ),
        ),
      ),
    );
  }
}
