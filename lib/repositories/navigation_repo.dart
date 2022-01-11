

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/pages/login.dart';

class NavigationRepo{
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: LoginPage.route,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: HomePage.route,
        builder: (context, state) => const HomePage(),
      ),
    ],
  );

  void pop({dynamic result}) {
    return _navigationKey.currentState!.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async{
    await Future.delayed(duration);
    return _router.go(routeName);
  }

  Future<dynamic> navigateToNamed(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async {
    await Future.delayed(duration);
    return _router.goNamed(routeName);
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

  GoRouter get router => _router;


}