
import 'package:http/http.dart' as http;


class FaqRepo {


  Future<void> getFaq() async {
    final http.Response response = await http.get( Uri.parse("http://rmbcloneapi.azurewebsites.net/api/Faq"));
    final String body = response.body;
  }

}