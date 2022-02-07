
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/network_module/api_headers.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';

class LocationsFilterRepo {

  Future<APIResponse<List<BranchType>>> getBranchTypes() async{
    final Map<String, String> headers = await ApiHeaders.appJsonNoAuth.createHeaders();
    final APIResponse response = await HTTPClient.instance.fetchData(ApiRoutes.branchType.path(), headers);

    if(response.responseType == ResponseTypes.ok) {
      final List<BranchType> branchTypes = (response.data as List).map((e) => BranchType.fromJson(e)).toList();
      return APIResponse(responseType: ResponseTypes.ok, data: branchTypes);
    }
    return APIResponse(responseType: response.responseType, error: response.error, data: response.data);
  }

  Future<APIResponse<List<BranchServiceType>>> getBranchServiceTypes() async {
    final Map<String, String> headers = await ApiHeaders.appJsonNoAuth.createHeaders();
    final APIResponse response = await HTTPClient.instance.fetchData(ApiRoutes.branchServiceType.path(), headers);

    if(response.responseType == ResponseTypes.ok) {
      final List<BranchServiceType> branchServiceTypes = (response.data as List).map((e) => BranchServiceType.fromJson(e)).toList();
      return APIResponse<List<BranchServiceType>>(responseType: ResponseTypes.ok, data: branchServiceTypes, error: response.error);
    }
    return APIResponse(responseType: response.responseType, error: response.error);
  }



}