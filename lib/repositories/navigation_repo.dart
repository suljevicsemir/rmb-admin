

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationRepo{
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  void pop({dynamic result}) {
    return _navigationKey.currentState!.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async{
    await Future.delayed(duration);
    return await _navigationKey.currentState!.pushNamed(routeName, arguments: arguments);
  }


  Future<dynamic> navigateAndRemove(String routeName, {dynamic arguments}) async{
    await Future.delayed(const Duration(milliseconds: 100));
    return _navigationKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
  }

  Future<dynamic> popCurrentAndPush(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState!.popAndPushNamed(routeName, arguments: arguments);
  }
  Future<void> popUntilNamed(String routeName) async{
    _navigationKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  Future<void> popMultipleRoutes(int count) async {
    int value = 0;
    _navigationKey.currentState!.popUntil((route) => value++ >= count);
  }

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldKey;
}