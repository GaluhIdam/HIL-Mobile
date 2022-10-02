import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static getURL() {
    return Config.baseURL;
  }

  static final FlutterSecureStorage storage = FlutterSecureStorage();

  static Future hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return {'logging': true, 'token': value};
    } else {
      return {'logging': false, 'token': ''};
    }
  }

  static Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future deleteToken() async {
    var value = await storage.read(key: 'token').then((value) {
      storage.delete(key: 'token');
      storage.deleteAll();
    });
    return value;
  }

  static Future login(String employeeId, String password) async {
    String urlLogin = getURL() + 'auth/login';
    final response = await http.post(Uri.parse(urlLogin),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': employeeId,
          'password': password,
        }));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final data = json['data'];
      final status = json['success'];
      final message = json['message'];
      final token = json['data']['accessToken'];
      if (token == null) {
        return {'status': status, 'message': message};
      } else {
        return {
          'status': status,
          'message': message,
          'data': data,
          'accessToken': token
        };
      }
    } else {
      final json = jsonDecode(response.body);
      final message = json['message'];
      final status = json['success'];
      return {'status': status, 'message': message};
    }
  }

  static Future logout(String? token) async {
    String urlLogout = getURL() + 'auth/logout';
    final response = await http.post(Uri.parse(urlLogout),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['message'];
      return parsed;
    }
  }
}
