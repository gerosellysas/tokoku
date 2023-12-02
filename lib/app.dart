import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_repo/shop_repo.dart';
import 'package:tokoku/bloc/catalog/catalog.bloc.dart';
import 'package:tokoku/bloc/search_product/search_product.bloc.dart';
import 'package:tokoku/bloc/transaction/transaction.bloc.dart';
import 'package:tokoku/cubit/detail_cubit/detail_cubit.dart';
import 'package:tokoku/cubit/detail_cubit/detail_state.dart';
import 'package:tokoku/navigation/app_route.dart';
import 'package:tokoku/res/themes/themes.dart';

import 'bloc/auth/auth.bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthRepo _authRepo;
  late final ShopRepo _shopRepo;

  @override
  void initState() {
    _authRepo = AuthRepo();
    _shopRepo = ShopRepo();
    super.initState();
  }

  @override
  void dispose() {
    _authRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthBloc(authRepo: _authRepo)),
          BlocProvider(
            create: (_) =>
                CatalogBloc(shopRepo: _shopRepo)..add(const CatalogStarted('')),
          ),
          BlocProvider(create: (_) => DetailCubit(DetailCubitState())),
          BlocProvider(create: (_) => SearchProductBloc(shopRepo: _shopRepo)),
          BlocProvider(
            create: (_) =>
                TransactionBloc(shopRepo: _shopRepo)..add(TransactionStarted()),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthStatus.authenticated:
                AppRouter.router.pushReplacement('/home');
              case AuthStatus.unauthenticated:
                AppRouter.router.pushReplacement('/login');
              case AuthStatus.unknown:
                break;
            }
          },
          child: MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          ),
        );
      },
      title: 'Tokoku',
      theme: AppThemes.themeData,
      // onGenerateRoute: (_) => SplashScreen.route(),
    );
  }
}
