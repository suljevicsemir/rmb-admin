

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/user/token_pair.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';
import 'package:rmb_admin/pages/login/login.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';
import 'package:rmb_admin/routing/navigator.dart';

class AuthRepo {

  Future<String?> getAccessToken() async{
    debugPrint("Getting cached access token");
    String? accessToken = await locator.get<SecureStorageRepo>().getValue(key: SecureStorageRepo.accessToken);
    final String? refreshToken = await locator.get<SecureStorageRepo>().getValue(key: SecureStorageRepo.refreshToken);
    if(accessToken == null || refreshToken == null) {
      return null;
    }
    bool isExpired = JwtDecoder.isExpired(accessToken);
    if(isExpired) {
      debugPrint("Cached access token expired.");
      APIResponse response = await HTTPClient.instance.postData(
          ApiRoutes.accessTokenRefresh.path(),
          {
            HttpHeaders.acceptLanguageHeader : 'en',
            HttpHeaders.contentTypeHeader : 'application/json; charset=utf-8'
          },
          TokenPair(refreshToken: refreshToken, accessToken: accessToken).toJson()
      );
      if(response.responseType == ResponseTypes.ok) {
        await saveTokenPair(tokenPair: TokenPair.fromJson(response.data));
        accessToken = (TokenPair.fromJson(response.data)).accessToken!;
      }
    }
    return accessToken;
  }

  Future<void> saveTokenPair({required TokenPair tokenPair}) async {
    await Future.wait([
      locator.get<SecureStorageRepo>().setValue(key: SecureStorageRepo.refreshToken, value: tokenPair.refreshToken!),
      locator.get<SecureStorageRepo>().setValue(key: SecureStorageRepo.accessToken, value: tokenPair.accessToken!),
    ]);
  }

  Future<void> saveUserId({required String id}) async {
    await locator.get<SecureStorageRepo>().setValue(key: SecureStorageRepo.userId, value: id);
  }

  Future<void> loginLocally({required TokenPair tokenPair}) async{
    final Map<String, dynamic> map = JwtDecoder.decode(tokenPair.accessToken!);
    final String id = map["http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier"];

    await Future.wait([
      saveTokenPair(tokenPair: tokenPair),
      saveUserId(id: id),
    ]);
  }


  Future<void> logout() async {
    await Future.wait([
      locator.get<SecureStorageRepo>().deleteAll(),
      locator.get<NavigationRepo>().navigateAndRemove(LoginPage.route)
    ]);
  }

  Future<bool> loggedIn() async {
    return await locator.get<SecureStorageRepo>().getValue(key: SecureStorageRepo.userId) != null;
  }
}