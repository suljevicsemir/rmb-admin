
import 'package:http/http.dart' as http;
import 'package:rmb_admin/models/city.dart';
import 'package:rmb_admin/network_module/api_path.dart';

class CitiesRepo {

  Future<void> createCity(City city) async {

    http.Response response = await http.post(Uri.parse('http://rmbcloneapi.azurewebsites.net/api/' + ApiRoutes.postCity.path), body: city.toJson());
    print(response.body);

  }


}