
import 'package:rmb_admin/models/user/credentials_pair.dart';
import 'package:rmb_admin/models/user/token_pair.dart';
import 'package:rmb_admin/network_module/api_headers.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';

class LoginRepository {

  Future<APIResponse<TokenPair>> login({required CredentialsPair credentialsPair}) async {
    final Map<String, String> headers = await ApiHeaders.appJsonNoAuth.createHeaders();
    final APIResponse response = await HTTPClient.instance.postData(ApiRoutes.token.path, headers, credentialsPair.toJson());
    if(response.responseType == ResponseTypes.ok) {
      return APIResponse(responseType: ResponseTypes.ok, data: TokenPair.fromJson(response.data));
    }
    return APIResponse(responseType: response.responseType, error: response.error);
  }
}