import 'package:flutter/material.dart';

final class NavigationRouteFactory {
  static Route<dynamic> of(Function pageConstructor) {
    return MaterialPageRoute(
        builder: (_) => pageConstructor()
    );
  }
}