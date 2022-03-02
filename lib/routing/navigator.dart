
import 'package:flutter/material.dart';
import 'package:rmb_admin/widgets/snackbars.dart';

class NavigationRepo{
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  dynamic pop({dynamic result}) {
    return _navigationKey.currentState!.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async{
    await Future.delayed(duration);
    return _navigationKey.currentState!.pushNamed(routeName, arguments: arguments);
  }


  Future<dynamic> navigateAndRemove(String routeName, {dynamic arguments, Duration duration = const Duration(milliseconds: 50)}) async{
    await Future.delayed(duration);
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(routeName, (_) => false, arguments: arguments);
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

  Future<void> showInvalidInputSnackBar(String label) async {
    _scaffoldKey.currentState!.clearSnackBars();
    _scaffoldKey.currentState!.showSnackBar(InvalidInputSnackBar(label: label));
  }
  Future<dynamic> showActionSuccessSnackBar(String label) async {
    _scaffoldKey.currentState!.showSnackBar(ActionSuccessSnackBar(label: label));
  }

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldKey;

}