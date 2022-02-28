

import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/pages/home/home.dart';
import 'package:rmb_admin/repositories/auth_repo.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';

class SplashProvider extends ChangeNotifier {

  SplashProvider() {
    _onInit();
  }

  Future<void> _onInit() async {
    final bool logged = await locator.get<AuthRepo>().loggedIn();
    final String? refreshToken = await locator.get<SecureStorageRepo>().getValue(key: SecureStorageRepo.refreshToken);

    if(!logged || (refreshToken == null || JwtDecoder.isExpired(refreshToken))) {
      await locator.get<AuthRepo>().logout();
      return;
    }
    locator.get<NavigationRepo>().navigateAndRemove(HomePage.route);
  }

}