import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class StatusService {
  static getURL() {
    return Config.baseURL;
  }

  //Get Data Status
  static Future<List<DropdownMenuItem<String>>> getStatus(String? token) async {
    String urlStatus = getURL() + 'master-status';
    try {
      final response = await http.get(Uri.parse(urlStatus),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataStatus = [];
        List<dynamic> status = [
          {
            "statusID": "1",
            "statusDESC": "OVERDUEJOBS",
          },
          {
            "statusID": "2",
            "statusDESC": "DUE IN 3 DAY",
          },
          {
            "statusID": "3",
            "statusDESC": "DUE IN 1 WEEK",
          },
          {
            "statusID": "4",
            "statusDESC": "DUE IN 1 MONTH",
          },
          {
            "statusID": "5",
            "statusDESC": "DUE IN 3 MONTH",
          },
          {
            "statusID": "6",
            "statusDESC": "ISSUED LAST 3 DAYS",
          },
          {
            "statusID": "7",
            "statusDESC": "OPEN",
          },
          {
            "statusID": "8",
            "statusDESC": "CLOSE",
          },
          {
            "statusID": "9",
            "statusDESC": "EXTENSION 1",
          },
          {
            "statusID": "10",
            "statusDESC": "CLOSED BY SWIFT",
          },
          {
            "statusID": "11",
            "statusDESC": "NOCATEGORY",
          },
          {
            "statusID": "12",
            "statusDESC": "NAMCLOSE",
          },
        ];
        status.forEach((element) {
          dataStatus.add(
            DropdownMenuItem(
                value: element['statusID'].toString(),
                child: Text(element['statusDESC'])),
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
  static Future<List<DropdownMenuItem<String>>> getStation(
      String? token) async {
    String urlStation = getURL() + 'master-station';
    try {
      final response = await http.get(Uri.parse(urlStation),
          headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        List<DropdownMenuItem<String>> dataStation = [];
        parsed.forEach((element) {
          dataStation.add(
            DropdownMenuItem(
                value: element['StaCode'],
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

  static Future getStationData(String? token) async {
    String urlStation = getURL() + 'master-station';
    final response = await http.get(Uri.parse(urlStation),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'];
      return parsed;
    } else {
      throw Exception('Failed to load stations');
    }
  }

  static Future updateStatus(
      dynamic itemId, token, status, staClose, desc) async {
    String urlStatus = getURL() + 'update-status/';
    final response = await http.post(Uri.parse(urlStatus + itemId), headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'Status': status,
      'staClose': staClose ?? '',
      'Desc': desc,
    });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final message = json['message'];
      final status = json['status'];
      return {'message': message, 'status': status};
    } else {
      final json = jsonDecode(response.body);
      final message = json['message'];
      final status = json['status'];
      return {'message': message, 'status': status};
    }
  }
}
