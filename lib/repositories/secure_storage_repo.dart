import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageRepo {

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true
    ),
    iOptions: IOSOptions(
      accessibility: IOSAccessibility.first_unlock
    )
  );

  static const String refreshToken = 'refresh';
  static const String accessToken = 'access';
  static const String firstRun = 'firstRun';
  static const String userId = 'userId';


  Future<void> setValue({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<String?> getValue({required String key}) async{
    return await _storage.read(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  Future<void> deleteKey({required String key}) async {
    await _storage.delete(key: key);
  }
}