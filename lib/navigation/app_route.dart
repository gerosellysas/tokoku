import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          GoRoute(
            path: 'detail',
            builder: (BuildContext context, GoRouterState state) {
              int productIndex = state.extra as int;
              return DetailScreen(productIndex: productIndex);
            },
          ),
          GoRoute(
            path: 'search',
            builder: (BuildContext context, GoRouterState state) {
              return const SearchScreen();
            },
          ),
          GoRoute(
            path: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
            },
          ),
        ],
      ),
    ],
  );
}
