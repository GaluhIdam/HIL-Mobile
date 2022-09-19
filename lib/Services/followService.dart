import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class FollowService {
  static getURL() {
    return Config.baseURL;
  }

  //Get data reason
  static Future<List<DropdownMenuItem<String>>> getReason() async {
    String urlReason = getURL() + 'master-reason';
    try {
      final response = await http.get(Uri.parse(urlReason));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataReason = [];
        parsed.forEach((element) {
          dataReason.add(
            DropdownMenuItem(
                value: element['reasonNo'], child: Text(element['reasonDesc'])),
          );
        });
        return dataReason;
      } else {
        throw Exception('Failed to load reasons');
      }
    } catch (e) {
      throw Exception('Error to load reasons');
    }
  }

  //Get data unit
  static Future<List<DropdownMenuItem<String>>> getUnit() async {
    String urlUnit = getURL() + 'master-unit';
    try {
      final response = await http.get(Uri.parse(urlUnit));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataUnit = [];
        parsed.forEach((element) {
          dataUnit.add(
            DropdownMenuItem(
                value: element['id'], child: Text(element['unit'])),
          );
        });
        return dataUnit;
      } else {
        throw Exception('Failed to load reasons');
      }
    } catch (e) {
      throw Exception('Error to load reasons');
    }
  }

  //Get data part name
  static Future<List<DropdownMenuItem<String>>> getPartName() async {
    String urlPartName = getURL() + 'master-unit';
    try {
      final response = await http.get(Uri.parse(urlPartName));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataPartname = [];
        // parsed.forEach((element) {
        //   dataPartname.add(
        //     DropdownMenuItem(
        //         value: element['id'], child: Text(element['unit'])),
        //   );
        // });
        return dataPartname;
      } else {
        throw Exception('Failed to load units');
      }
    } catch (e) {
      throw Exception('Error to load units');
    }
  }
}
