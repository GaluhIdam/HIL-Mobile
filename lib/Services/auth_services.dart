import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hil_mobile/Services/api.dart';

class AuthServices {
  static Future<http.Response> register(String name, String employeeId,
      String email, String password, String passwordConfirm) async {
    Map data = {
      'name': name,
      'employee_id': employeeId,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirm,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseUrl + 'auth/register');
    http.Response response = await http.post(url, headers: headers, body: body);

    print(response.body);
    return response;
  }

  static Future<http.Response> login(String employeeId, String password) async {
    Map data = {
      'employee_id': employeeId,
      'password': password,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseUrl + 'auth/login');
    http.Response response = await http.post(url, headers: headers, body: body);

    print(response.body);
    return response;
  }

  Future<http.Response> logout() async {
    var url = Uri.parse(baseUrl + 'auth/logout');
    http.Response response = await http.post(url, headers: headers);

    print(response.body);
    return response;
  }

  static Future<http.Response> getUser() async {
    var url = Uri.parse(baseUrl + 'auth/user');
    http.Response response = await http.get(url, headers: headers);

    print(response.body);
    return response;
  }
}
