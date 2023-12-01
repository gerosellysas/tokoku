import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tokoku/navigation/app_route.dart';
import 'package:tokoku/res/themes/themes.dart';
import 'package:tokoku/screens/home/home.dart';
import 'package:tokoku/screens/login/login.dart';
import 'package:tokoku/screens/splash/splash.dart';

import 'bloc/auth/auth.bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthRepo _authRepo;

  @override
  void initState() {
    _authRepo = AuthRepo();
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
      child: BlocProvider(
        create: (_) => AuthBloc(authRepo: _authRepo),
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
