import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class OptionService {
  static getURL() {
    return Config.baseURL;
  }

  //get data option
  static Future<List<DropdownMenuItem<String>>> getOption(String? token) async {
    String urlOption = getURL() + 'master-option';
    try {
      final response = await http.get(Uri.parse(urlOption),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataOption = [];
        parsed.forEach((element) {
          dataOption.add(
            DropdownMenuItem(
                value: element['optionID'].toString(),
                child: Text(element['long_name'])),
          );
        });
        return dataOption;
      } else {
        throw Exception('Failed to load options');
      }
    } catch (e) {
      throw Exception('Error to load options');
    }
  }

  static Future getOptions(String? token) async {
    String urlOption = getURL() + 'master-option';
    try {
      final response = await http.get(Uri.parse(urlOption),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed;
      } else {
        throw Exception('Failed to load options');
      }
    } catch (e) {
      throw Exception('Error to load options');
    }
  }

  //update option
  static Future updateOption(dynamic itemId, token, option) async {
    String urlStatusOption = getURL() + 'update-option/';
    final response = await http.post(Uri.parse(urlStatusOption + itemId),
        headers: {'Authorization': 'Bearer $token'},
        body: {'optionID': option});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final message = json['message'];
      final id = json['data'][0]['itemID'];
      return {'message': message, 'id': id};
    } else {
      final json = jsonDecode(response.body);
      final message = json['message'];
      return {'message': message};
    }
  }
}
