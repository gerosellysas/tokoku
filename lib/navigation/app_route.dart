import 'package:auth_repo/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tokoku/bloc/auth/auth.bloc.dart';
import 'package:tokoku/screens/cart/cart.dart';
import 'package:tokoku/screens/detail/detail.dart';
import 'package:tokoku/screens/home/home.dart';
import 'package:tokoku/screens/login/login.dart';
import 'package:tokoku/screens/search/search.dart';
import 'package:tokoku/screens/splash/splash.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    // redirect: (context, state) {
    //   var authStatus = context.read<AuthBloc>().state.status;
    //   if (authStatus == AuthStatus.unknown) {
    //     return '/';
    //   } else if (authStatus == AuthStatus.unauthenticated) {
    //     return '/login';
    //   } else {
    //     return null;
    //   }
    // },
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) {
              return const LoginScreen();
            },
          ),
          GoRoute(
            path: 'home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
    ],
  );
}
