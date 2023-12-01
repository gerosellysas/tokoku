import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokoku/navigation/app_route.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/cart/cart.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      title: 'Tokoku',
      theme: AppThemes.themeData,
    );
  }
}
