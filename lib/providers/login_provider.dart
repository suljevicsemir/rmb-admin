


import 'package:flutter/cupertino.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/user/credentials_pair.dart';
import 'package:rmb_admin/models/user/token_pair.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/repositories/login_repository.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';

class LoginProvider extends ChangeNotifier {
  bool _rememberMe = false;
  final LoginRepository loginRepository = LoginRepository();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> login() async {
    final CredentialsPair pair = CredentialsPair(password: _passwordController.text, email: _emailController.text);
    final APIResponse<TokenPair> response = await loginRepository.login(credentialsPair: pair);
    if(response.error == null && response.data != null) {
      await locator.get<SecureStorageRepo>().saveToken(tokenPair: response.data!);
      locator.get<NavigationRepo>().navigateTo(HomePage.route);
    }
    else {

    }

  }

  bool get rememberMe => _rememberMe;

  set rememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}