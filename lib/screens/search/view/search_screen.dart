import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tokoku/res/resources.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leadingWidth: AppSize.responsive(48),
        leading: AppIconButton(
          icon: AppImages.back,
          onPressed: () {},
        ),
        titleSpacing: 0.0,
        title: Hero(
          tag: 'searchField',
          child: AppTextField(
            height: AppSize.responsive(40),
            width: AppSize.responsive(328),
            radius: AppSize.responsive(24),
            autoFocus: true,
            inputAction: TextInputAction.search,
            prefixIcon: AppImages.search,
            hint: "Search on Tokoku",
            // onChanged: (username) => context
            //     .read<LoginBloc>()
            //     .add(LoginUsernameChanged(username)),
            onFieldSubmitted: (str) {
              // _loginSubmitted(context);
            },
            isError: false,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: AppSize.responsive(12)),
          ProductList(
            itemCount: 0,
            emptyList: 'Product not found',
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
