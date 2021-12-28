
import 'package:http/http.dart' as http;

class LoginRepository {

  Future<void> login({required String email, required String password}) async {
    http.Response response = await http.post(Uri.parse('http://rmbcloneapi.azurewebsites.net/token?email=$email&password=$password'));
    print("Response je: " + response.body);
  }
}