import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tokoku/res/resources.dart';
import 'package:tokoku/screens/cart/cart.dart';
import 'package:tokoku/screens/detail/view/detail_screen.dart';
import 'package:tokoku/screens/home/view/home_screen.dart';
import 'package:tokoku/screens/search/search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
      title: 'Tokoku',
      theme: AppThemes.themeData,
      home: const CartScreen(),
    );
  }
}
