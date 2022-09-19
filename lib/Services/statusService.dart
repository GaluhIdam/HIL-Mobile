import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class StatusService {
  static getURL() {
    return Config.baseURL;
  }

  //Get Data Status
  static Future<List<DropdownMenuItem<String>>> getStatus() async {
    String urlStatus = getURL() + 'master-status';
    try {
      final response = await http.get(Uri.parse(urlStatus));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataStatus = [];
        parsed.forEach((element) {
          dataStatus.add(
            DropdownMenuItem(
                value: element['StatusNo'], child: Text(element['StatusDesc'])),
          );
        });
        return dataStatus;
      } else {
        throw Exception('Failed to load status');
      }
    } catch (e) {
      throw Exception('Error to load status');
    }
  }

  //Get Data Station
  static Future<List<DropdownMenuItem<String>>> getStation() async {
    String urlStation = getURL() + 'master-station';
    try {
      final response = await http.get(Uri.parse(urlStation));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataStation = [];
        parsed.forEach((element) {
          dataStation.add(
            DropdownMenuItem(
                value: element['StaID'],
                child: Text(element['StaCode'] ?? '-')),
          );
        });
        return dataStation;
      } else {
        throw Exception('Failed to load stations');
      }
    } catch (e) {
      throw Exception('Error to load stations');
    }
  }
}