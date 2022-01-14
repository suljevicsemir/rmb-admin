
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rmb_admin/main/config/flavor_config.dart';
import 'package:rmb_admin/main/locator.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/pages/login.dart';
import 'package:rmb_admin/repositories/navigation_repo.dart';
import 'package:rmb_admin/repositories/secure_storage_repo.dart';


class HTTPClient {

  static final HTTPClient _singleton = HTTPClient();
  static HTTPClient get instance => _singleton;

  Future<APIResponse> fetchData(String url, Map<String, String> headers, {Map<String, String>? params, bool fromIsolate = false, int timeoutSeconds = 3}) async {
    debugPrint("Fetching data from: ${FlavorConfig.instance.flavorValues.baseUrl}$url");
    final Map<String, dynamic> arguments = {
      'baseUrl' : FlavorConfig.instance.flavorValues.baseUrl,
      'url'     : url,
      'headers' : headers,
      'timeout' : timeoutSeconds,
      'params'  : params
    };

    final APIResponse response = await _fetch(arguments);
    return response;
  }

  static Future<APIResponse> _fetch(Map<String, dynamic> arguments) async{
    String uri = arguments["baseUrl"] + arguments["url"];
    try {
      http.Response response = await http.get(
        Uri.parse(uri + _queryParameters(arguments["params"])),
        headers: arguments["headers"],
      ).timeout(Duration(seconds: arguments["timeout"]));
      return _parseResponse(response);
    }
    on TimeoutException catch (_) {
      return const APIResponse(responseType: ResponseTypes.timeout);
    }
    on Exception catch(_) {
      return const APIResponse(responseType: ResponseTypes.unexpected);
    }
  }

  Future<APIResponse> postData(String url, Map<String, String> headers, dynamic body, {int timeoutSeconds = 3}) async {
    debugPrint("Posting data to: ${FlavorConfig.instance.flavorValues.baseUrl}$url");
    final Map<String, dynamic> arguments = {
      'baseUrl' : FlavorConfig.instance.flavorValues.baseUrl,
      'url'     : url,
      'headers' : headers,
      'body'    : body
    };
    return await _post(arguments);
  }

  static Future<APIResponse> _post(Map<String, dynamic> arguments) async {
    final String uri = arguments["baseUrl"] + arguments["url"];
    try {
      http.Response response = await http.post(
          Uri.parse(uri),
          headers: arguments["headers"],
          body: jsonEncode(arguments["body"])
      ).timeout(const Duration(seconds: 3));
      final APIResponse apiResponse = await _parseResponse(response);
      return apiResponse;
    }
    on TimeoutException catch (_) {
      return const APIResponse(responseType: ResponseTypes.timeout);
    }
    on Exception catch(_) {
      return const APIResponse(responseType: ResponseTypes.unexpected);
    }
  }

  Future<APIResponse> putData(String url, Map<String, String> headers, dynamic body) async {
    debugPrint("Putting data to: ${FlavorConfig.instance.flavorValues.baseUrl}$url");
    final Map<String, dynamic> arguments = {
      'baseUrl' : FlavorConfig.instance.flavorValues.baseUrl,
      'url'     : url,
      'headers' : headers,
      'body'    : body
    };
    return await _put(arguments);
  }

  static Future<APIResponse> _put(Map<String, dynamic> arguments) async {
    String uri = arguments["baseUrl"] + arguments["url"];
    try {
      http.Response response = await http.put(
          Uri.parse(uri),
          headers: arguments["headers"],
          body: jsonEncode(arguments["body"])
      ).timeout(const Duration(seconds: 3));
      return _parseResponse(response);
    }
    on TimeoutException catch (_) {
      return const APIResponse(responseType: ResponseTypes.timeout);
    }
    on Exception catch(_) {
      return const APIResponse(responseType: ResponseTypes.unexpected);
    }
  }

  Future<APIResponse> deleteData(String url, Map<String, String> headers, dynamic body) async {
    debugPrint("Deleting data from: ${FlavorConfig.instance.flavorValues.baseUrl}$url");
    final Map<String, dynamic> arguments = {
      'baseUrl' : FlavorConfig.instance.flavorValues.baseUrl,
      'url'     : url,
      'headers' : headers,
      'body'    : body
    };
    return await _delete(arguments);
  }

  Future<APIResponse> _delete(Map<String, dynamic> arguments) async {
    String uri = arguments["baseUrl"] + arguments["url"];
    try {
      http.Response response = await http.delete(
          Uri.parse(uri),
          headers: arguments["headers"],
          body: jsonEncode(arguments["body"])
      ).timeout(const Duration(seconds: 3));
      return _parseResponse(response);
    }
    on TimeoutException catch (_) {
      return const APIResponse(responseType: ResponseTypes.timeout);
    }
    on Exception catch(_) {
      return const APIResponse(responseType: ResponseTypes.unexpected);
    }
  }

  static Future<APIResponse> _parseResponse(http.Response response) async {
    print(response.statusCode);
    switch(response.statusCode) {
      case 200:
      case 201:
      case 204:
        if(response.body.isEmpty) {
          return const APIResponse(
            data: {},
            responseType: ResponseTypes.ok
          );
        }
        String source = const Utf8Decoder().convert(response.bodyBytes);
        return APIResponse(
          data: jsonDecode(source),
          responseType: ResponseTypes.ok
        );
      case 400:
        return APIResponse(
          responseType: ResponseTypes.badRequest,
          error: response.body
        );
      case 401:
        bool logged = locator.get<SecureStorageRepo>().isLoggedIn;
        if(logged) {
          await Future.wait([
            locator.get<SecureStorageRepo>().deleteAll(),
            //locator.get<SharedPref>().setFinishedRegistrationFlow(false),
            locator.get<NavigationRepo>().navigateAndRemove(LoginPage.route),
          ]);
        }
        return APIResponse(
          responseType: ResponseTypes.unauthorised,
          error: response.body,
        );
      case 403:
        return APIResponse(
          responseType: ResponseTypes.unauthorised,
          error: response.body
        );
      case 404:
        return APIResponse(
            responseType: ResponseTypes.notFound,
            data: {}
        );
      default:
        print(response.body);
        //locator.get<NavigationRepo>().navigateTo("UnexpectedErrorRoute");
        return const APIResponse(responseType: ResponseTypes.unexpected);
    }
  }

  static String _queryParameters(Map<String, String>? params) {
    if (params != null) {
      final Uri jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }


}