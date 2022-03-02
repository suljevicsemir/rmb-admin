


import 'package:rmb_admin/models/locations_filter/branch/branch.dart';
import 'package:rmb_admin/models/locations_filter/branch/branch_post.dart';
import 'package:rmb_admin/network_module/api_headers.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';

class BranchesRepository {


  Future<bool> createBranch({required BranchPost branch}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    final APIResponse response = await HTTPClient.instance.postData(ApiRoutes.branch.path(), headers, branch.toJson());
    return response.error == null;
  }

  Future<APIResponse<List<Branch>>> getBranches() async {
    final Map<String, String> headers = await ApiHeaders.appJsonNoAuth.createHeaders();
    final APIResponse response = await HTTPClient.instance.fetchData(ApiRoutes.branch.path(), headers);
    if(response.error == null) {
      final List<Branch> branches = (response.data as List).map((e) => Branch.fromJson(e)).toList();
      return APIResponse<List<Branch>>(
        responseType: ResponseTypes.ok,
        data: branches
      );
    }
    return APIResponse(responseType: response.responseType, error: response.error, data: response.data);
  }

  Future<bool> deleteBranch({required Branch branch}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    final APIResponse response = await HTTPClient.instance.deleteData(ApiRoutes.branchEdit.path([branch.id!]), headers, {});
    return response.error == null;
  }

  Future<bool> editBranch({required BranchPost branch, required String id}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    final APIResponse response = await HTTPClient.instance.putData(ApiRoutes.branchEdit.path([id]), headers, branch.toJson());
    return response.error == null;
  }

}