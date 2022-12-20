
import 'package:http/http.dart' as http;
import 'package:keycloak_test/env.dart';

class AuthRepositoryKeyCloack {
  static Future<bool> login(String username, String password) async {
    late bool success = false;

    try {
      final response = await http.post(
        Uri.parse(Env.BASE_URL + Env.GET_TOKEN),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'username': username,
          'password': password,
          'grant_type': 'password',
          'client_id': Env.CLIENT_ID,
          'client_secret': Env.CLIENT_SECRET,
        },
      );

      success = response.statusCode == 200;
            
    } catch (e) {
      success = false;
    }

    return success;
  }
}
