


import 'package:rmb_admin/models/locations_filter/branch/branch_post.dart';
import 'package:rmb_admin/network_module/api_headers.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/http_client.dart';

class BranchesRepository {


  Future<void> createBranch({required BranchPost branch}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    await HTTPClient.instance.postData(ApiRoutes.branch.path(), headers, branch.toJson());
  }
}