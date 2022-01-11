
import 'package:rmb_admin/models/user/credentials_pair.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';

class LoginRepository {

  Future<void> login({required CredentialsPair credentialsPair}) async {
    final APIResponse response = await HTTPClient.instance.postData(ApiRoutes.token.path, {}, credentialsPair.toJson());
    if(response.responseType == ResponseTypes.ok) {

    }
  }
}