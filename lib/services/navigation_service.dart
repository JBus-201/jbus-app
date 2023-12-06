import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(MaterialPageRoute routeName) {
    return navigatorKey.currentState!.push(routeName);
  }

  goBack<T>({T? result}) {
    return navigatorKey.currentState!.pop<T>(result);
  }
}
