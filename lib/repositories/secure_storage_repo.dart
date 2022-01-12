import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rmb_admin/models/user/token_pair.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecureStorageRepo {

  late SharedPreferences _preferences;
  TokenPair? _tokenPair;

  Future<void> websiteStart() async {
    _preferences = await SharedPreferences.getInstance();
    _tokenPair = TokenPair(refreshToken: _preferences.getString(refreshToken), accessToken: _preferences.getString(accessToken));
  }

  static const String refreshToken = 'refresh';
  static const String accessToken = 'access';

  Future<void> setValue({
    required String key,
    required String value
  }) async {
    await _preferences.setString(key, value);
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

  bool get isLoggedIn => _tokenPair != null && _tokenPair!.refreshToken != null && !JwtDecoder.isExpired(_tokenPair!.refreshToken!);


  Future<void> saveToken({required TokenPair tokenPair}) async {
    await Future.wait([
      _preferences.setString(refreshToken, tokenPair.refreshToken!),
      _preferences.setString(accessToken, tokenPair.accessToken!)
    ]);
  }
}