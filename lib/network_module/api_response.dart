

import 'package:flutter/cupertino.dart';

enum ResponseTypes {
  ok,
  timeout,
  badRequest,
  unauthorised,
  unexpected,
  notFound
}

@immutable
class APIResponse<T> {

  const APIResponse({required this.responseType, this.data});

  final ResponseTypes responseType;
  final T? data;
}