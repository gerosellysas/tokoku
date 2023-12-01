import 'dart:ui';

import 'package:flutter/material.dart';

class AppSize {
  static FlutterView view =
      WidgetsBinding.instance.platformDispatcher.views.first;
  static Size size = view.physicalSize / view.devicePixelRatio;
  static double h = size.height;
  static double w = size.width;
  static double responsive(double value) => (value / w) * w;
}
