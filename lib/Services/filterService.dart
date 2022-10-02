import 'dart:convert';

import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class FilterService {
  static getURL() {
    return Config.baseURL;
  }

  static Future getAcreg(String? token) async {
    String urlActype = getURL() + 'master-acreg';
    final response = await http
        .get(Uri.parse(urlActype), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data']['data'];
      // print(parsed);
      return parsed.toList();
    } else {
      throw Exception('Failed to load acreg');
    }
  }

  static Future getActype(String? token) async {
    String urlActype = getURL() + 'master-actype';
    final response = await http
        .get(Uri.parse(urlActype), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data']['data'];
      return parsed.toList();
    } else {
      throw Exception('Failed to load actype');
    }
  }

  static Future getStatus(String? token) async {
    String urlActype = getURL() + 'master-status';
    final response = await http
        .get(Uri.parse(urlActype), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'];
      return parsed.toList();
    } else {
      throw Exception('Failed to load status');
    }
  }

  static Future getCategory(String? token) async {
    String urlActype = getURL() + 'master-category';
    final response = await http
        .get(Uri.parse(urlActype), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'];
      return parsed.toList();
    } else {
      throw Exception('Failed to load category');
    }
  }
}
