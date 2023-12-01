import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoku/bloc/catalog/catalog.bloc.dart';
import 'package:tokoku/cubit/detail_cubit/detail_cubit.dart';
import 'package:tokoku/cubit/detail_cubit/detail_state.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/detail/view/detail_button.dart';
import 'package:tokoku/screens/detail/view/detail_product.dart';

class DetailScreen extends StatelessWidget {
  final int? productIndex;
  const DetailScreen({super.key, this.productIndex});

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
          BlocSelector<CatalogBloc, CatalogState, CatalogLoaded>(
            selector: (state) {
              return state as CatalogLoaded;
            },
            builder: (context, state) {
              return BlocBuilder<DetailCubit, DetailCubitState>(
                builder: (context, cubit) {
                  return DetailProduct(
                    product: state.catalog[productIndex!],
                    favorite: cubit.favorite,
                    onFavoriteTap: () =>
                        context.read<DetailCubit>().onFavoriteTapped(),
                  );
                },
              );
            },
          ),
          DetailButton(onTap: () {}),
        ],
      ),
    );
  }
}
