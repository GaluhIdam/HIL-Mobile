import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hil_mobile/Models/followlistModel.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class FollowService {
  static getURL() {
    return Config.baseURL;
  }

  //Get data reason
  static Future<List<DropdownMenuItem<String>>> getReason(String token) async {
    String urlReason = getURL() + 'master-reason';
    final response = await http
        .get(Uri.parse(urlReason), headers: {'Authorization': 'Bearer $token'});
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
  }

  //Get data unit
  static Future<List<DropdownMenuItem<String>>> getUnit(String token) async {
    String urlUnit = getURL() + 'master-unit';
    final response = await http
        .get(Uri.parse(urlUnit), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'].cast<Map<String, dynamic>>();
      List<DropdownMenuItem<String>> dataUnit = [];
      parsed.forEach((element) {
        dataUnit.add(
          DropdownMenuItem(value: element['id'], child: Text(element['unit'])),
        );
      });
      return dataUnit;
    } else {
      throw Exception('Failed to load reasons');
    }
  }

  //Get data follow list
  static Future getFollowList(String id, token) async {
    String urlPartName = getURL() + 'detail-follow/';
    final response = await http.get(Uri.parse(urlPartName + id),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data'];
      return {
        'foid': parsed["FOID"],
        'itemIdfo': parsed["ItemIDFO"],
        'follow': parsed["Follow"],
        'unitFo': parsed["UnitFO"],
        'nameFo': parsed["NameFO"],
        'dateFo': parsed["DateFO"],
        'nextFo': parsed["NextFO"],
        'insertFo': parsed["InsertFO"],
        'partName': parsed["PartName"],
        'partNbr': parsed["PartNbr"],
        'snIn': parsed["SNIn"],
        'sNout': parsed["SNout"],
        'by': parsed["By"],
        'reason': parsed["reason"],
        'countFollow': parsed["CountFollow"],
        'insertDate': parsed["insert_date"],
      };
    } else {
      throw Exception('Failed to load follow list');
    }
  }

  //Update Follow List
  static Future updateFollow(dynamic itemId, token, follow, nextFO, partNum,
      partName, snIn, snOut, reason) async {
    String urlFollow = getURL() + 'update-follow';

    final response = await http.post(Uri.parse(urlFollow), headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'itemID': itemId,
      'Follow': follow,
      'NextFO': nextFO,
      'PartName': partName,
      'PartNbr': partNum,
      'SNIn': snIn,
      'SNOut': snOut,
      'reason': reason,
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final message = json['message'];
      return {'message': message};
    } else {
      final json = jsonDecode(response.body);
      final message = json['message'];
      return {'message': message};
    }
  }
}
