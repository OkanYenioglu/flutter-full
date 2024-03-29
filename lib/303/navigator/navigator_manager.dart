import 'package:flutter/material.dart';
import 'package:flutter_full/product/navigator/navigator_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();

  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  Future<void> pushToPage(NavigateRoutes route, {Object? arguments}) async {
    await _navigatorGlobalKey.currentState?.pushNamed(route.withParaf, arguments: arguments);
  }
}
