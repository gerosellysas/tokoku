import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tokoku/bloc/catalog/catalog.bloc.dart';
import 'package:tokoku/bloc/search_product/search_product.bloc.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/home/view/home_filter_category.dart';
import 'package:tokoku/screens/home/view/home_search.dart';

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
            onPressed: () => context.push('/cart'),
          ),
          AppIconButton(
            icon: AppImages.profile,
            onPressed: () => (),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'searchField',
            child: HomeSearch(onTap: () => context.push('/search')),
          ),
          SizedBox(height: AppSize.responsive(24)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              return switch (state) {
                CatalogLoading() => const SizedBox(),
                CatalogLoaded() => HomeCategoryButtons(
                    itemCount: state.categories.length + 1,
                    itemBuilder: (contex, i) {
                      if (i == 0) {
                        return HomeFilterCategory(
                          onTap: () {
                            context
                                .read<CatalogBloc>()
                                .add(const CatalogStarted(''));
                          },
                        );
                      }
                      i -= 1;
                      return HomeFilterCategory(
                        category: state.categories[i],
                        onTap: () {
                          context.read<CatalogBloc>().add(CatalogStarted(
                                state.categories[i],
                              ));
                        },
                      );
                    },
                  ),
                CatalogError() => const SizedBox(),
              };
            },
          ),
          SizedBox(height: AppSize.responsive(24)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              return switch (state) {
                CatalogLoading() => const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                CatalogError() => Expanded(
                    child: Center(
                      child: Text(
                        'Errror while loading products',
                        style: AppFonts.italic(AppColors.darkGrey),
                      ),
                    ),
                  ),
                CatalogLoaded() => ProductList(
                    itemCount: state.catalog.length,
                    itemBuilder: (context, i) => ProductCard(
                      product: state.catalog[i],
                      onTap: () => context.push('/detail',
                          extra: state.catalog[i].id! - 1),
                    ),
                  ),
              };
            },
          ),
        ],
      ),
    );
  }
}
