

import 'dart:io';

import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';

enum ApiHeaders {
  appJsonNoAuth,
  appJson
}


extension ApiHeadersHelper on ApiHeaders {
  Future<Map<String, String>> createHeaders() async {
    print("gettin access token call");
    String? accessToken = await locator.get<SecureStorageRepo>().getAccessToken();


    switch(this) {
      case ApiHeaders.appJson:
        return <String, String> {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
          HttpHeaders.authorizationHeader: 'Bearer $accessToken'
        };
      case ApiHeaders.appJsonNoAuth:
        return <String, String> {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        };
    }
  }
}