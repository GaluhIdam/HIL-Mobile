import 'dart:convert';
import 'dart:async';
import 'package:hil_mobile/Providers/config.dart';
import 'package:hil_mobile/models/taskModel.dart';
import 'package:http/http.dart' as http;

class TaskProvider {
  static getURL() {
    return Config.baseURL;
  }

  //Get All Data to be List
  static Future<List<Datum>> getTask() async {
    String urlTask = getURL() + 'task';
    try {
      final response = await http.get(Uri.parse(urlTask));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Datum>((json) => Datum.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load task');
      }
    } catch (e) {
      throw Exception('Error to load task');
    }
  }

//Get Detail Data
  static Future getTaskDetail(String id) async {
    String urlTask = getURL() + 'task/';
    try {
      final response = await http.get(Uri.parse(urlTask + id));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'];
        // Datum jsx = Datum.fromJson(parsed);
        return parsed;
      } else {
        throw Exception('Failed to load task');
      }
    } catch (e) {
      throw Exception('Error to load task');
    }
  }
}
