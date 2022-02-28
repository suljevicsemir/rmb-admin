

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/models/user/token_pair.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';
import 'package:rmb_admin/pages/login.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';

class AuthRepo {

  TokenPair? _tokenPair;

  Future<void> saveTokenPair({required TokenPair tokenPair}) async {

  }




  Future<String?> getAccessToken() async{
    if(_tokenPair == null || _tokenPair!.accessToken == null) {
      debugPrint("Local token pair is null");
      return null;
    }

    bool isExpired = JwtDecoder.isExpired(_tokenPair!.accessToken!);
    if(isExpired) {
      debugPrint("Cached access token expired.");
      APIResponse response = await HTTPClient.instance.postData(
          ApiRoutes.token.path(),
          {
            HttpHeaders.acceptLanguageHeader : 'en',
            HttpHeaders.contentTypeHeader : 'application/json; charset=utf-8'
          },
          {
            'refresh' : _tokenPair!.refreshToken!
          }
      );
      if(response.responseType == ResponseTypes.ok) {
        await _saveTokenPair(tokenPair: TokenPair.fromJson(response.data));
      }
    }
    return _tokenPair!.accessToken;
  }

  Future<void> _saveTokenPair({required TokenPair tokenPair}) async {
    _tokenPair = tokenPair;
    await Future.wait([
      locator.get<SecureStorageRepo>().setValue(key: SecureStorageRepo.refreshToken, value: tokenPair.refreshToken!),
      locator.get<SecureStorageRepo>().setValue(key: SecureStorageRepo.accessToken, value: tokenPair.accessToken!),
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