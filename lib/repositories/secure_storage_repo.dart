

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepo {

  final FlutterSecureStorage _instance = const FlutterSecureStorage();

  Map<String, String> _fields = <String, String>{};

  Future<void> websiteStart() async {
    _fields = await _instance.readAll();
  }

  static const String refreshToken = 'refresh';
  static const String accessToken = 'access';

  Future<void> setValue({
    required String key,
    required String value
  }) async {
    _fields[key] = value;
    await _instance.write(key: key, value: value);
  }

  Future<String?> getValue({required String key}) async {
    if(_fields.containsKey(key)) {
      return _fields[key];
    }
    return await _instance.read(key: key);
  }

  Future<void> deleteAll() async {
    await _instance.deleteAll();
  }

  Future<void> deleteKey({required String key}) async {
    await _instance.delete(key: key);
  }




}