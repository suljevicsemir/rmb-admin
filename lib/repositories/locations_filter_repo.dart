

import 'package:rmb_admin/models/locations_filter/atm_filter.dart';
import 'package:rmb_admin/models/locations_filter/branch_service_type.dart';
import 'package:rmb_admin/models/locations_filter/branch_type.dart';
import 'package:rmb_admin/models/locations_filter/locations_filter_container.dart';
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

  Future<APIResponse<List<ATMFilter>>> getATMFilters() async{
    final Map<String, String> headers = await ApiHeaders.appJsonNoAuth.createHeaders();
    final APIResponse response = await HTTPClient.instance.fetchData(ApiRoutes.atmService.path(), headers);
    if(response.responseType == ResponseTypes.ok) {
      final List<ATMFilter> atmFilters = (response.data as List).map((e) => ATMFilter.fromJson(e)).toList();
      return APIResponse<List<ATMFilter>>(responseType: ResponseTypes.ok, data: atmFilters, error: response.error);
    }
    return APIResponse(responseType: response.responseType, error: response.error);
  }

  Future<LocationsFilterContainer> getFilters() async {
    List<APIResponse> results = await Future.wait([
      getBranchTypes(),
      getBranchServiceTypes(),
      getATMFilters()
    ]);
    return LocationsFilterContainer(
      branchTypes: results[0].error == null ? results[0].data : null,
      branchServiceTypes: results[1].error == null ? results[1].data : null,
      atmFilters: results[2].error == null ? results[2].data : null
    );
  }

  Future<APIResponse> createBranchType({required BranchType branchType}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.postData(ApiRoutes.branchType.path(), headers, branchType.toJson());
  }

  Future<APIResponse> createBranchServiceType({required BranchServiceType branchServiceType}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.postData(ApiRoutes.branchServiceType.path(), headers, branchServiceType.toJson());
  }

  Future<APIResponse> createATMType({required ATMFilter atmFilter}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.postData(ApiRoutes.atmService.path(), headers, atmFilter.toJson());
  }

  Future<APIResponse> deleteBranchType({required String id}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.deleteData(ApiRoutes.branchType.path([id]), headers, {});
  }

  Future<APIResponse> deleteBranchServiceType({required String id}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.deleteData(ApiRoutes.branchServiceType.path([id]), headers, {});
  }

  Future<APIResponse> deleteATMService({required String id}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    return await HTTPClient.instance.deleteData(ApiRoutes.atmService.path([id]), headers, {});
  }
}