
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/network_module/api_headers.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';

class CitiesRepo {

  Future<APIResponse> createCity({required City city}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.postData(ApiRoutes.city.path(), headers, city.toJson());

  }

  Future<APIResponse<List<City>>> getCities() async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    final APIResponse response = await HTTPClient.instance.fetchData(ApiRoutes.city.path(), headers);
    if(response.responseType == ResponseTypes.ok) {
      final List<City> cities = (response.data as List).map((e) => City.fromJson(e)).toList();
      return APIResponse<List<City>>(
        responseType: ResponseTypes.ok,
        data: cities
      );
    }
    return APIResponse(responseType: response.responseType, error: response.error, data: response.data);
  }

  Future<APIResponse> deleteCity({required City city}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.deleteData(ApiRoutes.cityEdit.path([city.id!]), headers, {});
  }

  Future<APIResponse> editCity({required City city}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.putData(ApiRoutes.cityEdit.path([city.id!]), headers, city.toJson());
  }


}