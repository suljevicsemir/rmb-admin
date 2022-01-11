


import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();



  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> login() async {

  }

  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }
}