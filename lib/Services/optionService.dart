import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class OptionService {
  static getURL() {
    return Config.baseURL;
  }

  static Future<List<DropdownMenuItem<String>>> getOption() async {
    String urlOption = getURL() + 'master-option';
    try {
      final response = await http.get(Uri.parse(urlOption));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataOption = [];
        parsed.forEach((element) {
          dataOption.add(
            DropdownMenuItem(
                value: element['optionID'], child: Text(element['long_name'])),
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
}
