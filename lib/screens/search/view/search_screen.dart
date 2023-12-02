import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:tokoku/bloc/search_product/search_product.bloc.dart';
import 'package:tokoku/res/resources.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    timeDilation = 1.5;
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) {
        context.read<SearchProductBloc>().add(const SearchProductInit());
        context.pop();
      },
      child: Scaffold(
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
            onPressed: () {
              context.read<SearchProductBloc>().add(const SearchProductInit());
              context.pop();
            },
          ),
          titleSpacing: 0.0,
          title: Hero(
            tag: 'searchField',
            child: BlocBuilder<SearchProductBloc, SearchProductState>(
              buildWhen: (previous, current) =>
                  previous.keyword != current.keyword,
              builder: (context, state) {
                return AppTextField(
                  height: AppSize.responsive(40),
                  width: AppSize.responsive(328),
                  radius: AppSize.responsive(24),
                  autoFocus: true,
                  inputAction: TextInputAction.search,
                  prefixIcon: AppImages.search,
                  hint: "Search on Tokoku",
                  onChanged: (keyword) => context
                      .read<SearchProductBloc>()
                      .add(SearchKeywordChanged(keyword)),
                  onFieldSubmitted: (str) {
                    context
                        .read<SearchProductBloc>()
                        .add(const SearchProductSubmitted());
                  },
                  isError: false,
                );
              },
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: AppSize.responsive(12)),
            BlocBuilder<SearchProductBloc, SearchProductState>(
              builder: (context, state) {
                return state.status.isInProgress
                    ? const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : state.status.isSuccess
                        ? ProductList(
                            itemCount: state.products.length,
                            itemBuilder: (context, i) => ProductCard(
                              product: state.products[i],
                              onTap: () => context.push('/detail',
                                  extra: state.products[i].id! - 1),
                            ),
                          )
                        : state.status.isFailure
                            ? Expanded(
                                child: Center(
                                  child: Text(
                                    'No product found',
                                    style: AppFonts.italic(AppColors.darkGrey),
                                  ),
                                ),
                              )
                            : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
