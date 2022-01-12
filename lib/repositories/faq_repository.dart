
import 'package:rmb_admin/models/faq_item.dart';
import 'package:rmb_admin/network_module/api_headers.dart';
import 'package:rmb_admin/network_module/api_path.dart';
import 'package:rmb_admin/network_module/api_response.dart';
import 'package:rmb_admin/network_module/http_client.dart';


class FaqRepo {


  Future<APIResponse<List<FaqItem>>> getFaq() async {
    final APIResponse response = await HTTPClient.instance.fetchData(ApiRoutes.faq.path(), {});
    if(response.responseType == ResponseTypes.ok) {
      final List<FaqItem> list =  (response.data as List).map((e) => FaqItem.fromJson(e)).toList();
      return APIResponse(
        data: list,
        responseType: ResponseTypes.ok
      );
    }
    return const APIResponse(responseType: ResponseTypes.ok);
  }

  Future<APIResponse<FaqItem>> editFaqItem({required FaqItem faqItem}) async {
    final Map<String, String> headers = await ApiHeaders.appJson.createHeaders();
    final APIResponse response = await HTTPClient.instance.putData(ApiRoutes.faqEdit.path([faqItem.id!]), headers, faqItem.toJson());
    if(response.responseType == ResponseTypes.ok) {
      return APIResponse(responseType: ResponseTypes.ok, data: faqItem);
    }
    return APIResponse(responseType: response.responseType, error: response.error);

  }

}