

import 'dart:io';

enum ApiHeaders {
  appJsonNoAuth,
  appJson
}


extension ApiHeadersHelper on ApiHeaders {
  Future<Map<String, String>> createHeaders() async {
    switch(this) {
      case ApiHeaders.appJson:
        return <String, String> {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        };
      case ApiHeaders.appJsonNoAuth:
        return <String, String> {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
        };
    }
  }
}