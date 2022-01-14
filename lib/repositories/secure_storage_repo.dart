import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rmb_admin/models/user/token_pair.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageRepo {

  late SharedPreferences _preferences;
  TokenPair? _tokenPair;

  Future<void> websiteStart() async {
    _preferences = await SharedPreferences.getInstance();
    if(_preferences.getString(refreshToken) == null || JwtDecoder.isExpired(_preferences.getString(refreshToken)!)) {
      return;
    }
    _tokenPair = TokenPair(refreshToken: _preferences.getString(refreshToken), accessToken: _preferences.getString(accessToken));
  }

  static const String refreshToken = 'refresh';
  static const String accessToken = 'access';
  static const String rememberMe = 'remember_me';
  Future<void> setValue({
    required String key,
    required String value
  }) async {
    await _preferences.setString(key, value);
  }

  Future<String?> getAccessToken() async{
    if( _tokenPair == null) {
      return null;
    }

    bool isExpired = JwtDecoder.isExpired(_tokenPair!.accessToken!);

    if(isExpired) {
      debugPrint("Cached access token expired");
      APIResponse response = await HTTPClient.instance.postData(ApiRoutes.accessTokenRefresh.path(), {
        HttpHeaders.acceptLanguageHeader : 'en',
        HttpHeaders.contentTypeHeader : 'application/json; charset=utf-8'
      }, _tokenPair!.toJson());
      if(response.responseType == ResponseTypes.ok) {
        await saveToken(tokenPair: TokenPair.fromJson(response.data));
      }
      else {
        debugPrint(response.responseType.toString());
      }
    }
    return _tokenPair!.accessToken;
  }


  String? getValue({required String key}) {
    return _preferences.getString(key);
  }

  Future<void> deleteAll() async {
    await _preferences.clear();
  }

  Future<void> deleteKey({required String key}) async {
    await _preferences.remove(key);
  }

  bool get isLoggedIn {
    final bool? rememberMeValue = _preferences.getBool(rememberMe);
    if(rememberMeValue == null || !rememberMeValue) {
      return false;
    }
    return _tokenPair != null && _tokenPair!.refreshToken != null && !JwtDecoder.isExpired(_tokenPair!.refreshToken!);
  }


  Future<void> saveToken({required TokenPair tokenPair}) async {
    await Future.wait([
      _preferences.setString(refreshToken, tokenPair.refreshToken!),
      _preferences.setString(accessToken, tokenPair.accessToken!)
    ]);
    _tokenPair = tokenPair;
  }
}