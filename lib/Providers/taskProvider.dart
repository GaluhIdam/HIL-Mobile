import 'dart:convert';
import 'dart:async';
import 'package:hil_mobile/models/taskModel.dart';
import 'package:http/http.dart' as http;

class TaskProvider {
  //Get All Data to be List
  static Future<List<Datum>> getTask() async {
    String urlTask = 'http://10.0.2.2:8000/api/task';
    try {
      final response = await http.get(Uri.parse(urlTask));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed.map<Datum>((json) => Datum.fromJson(json)).toList();
      } else
        return [];
    } catch (e) {
      // print(e.toString());
      return [];
    }
  }

//Get Detail Data
  static Future<List<Datum>> getTaskDetail(String id) async {
    String urlTask = 'http://10.0.2.2:8000/api/task/';
    try {
      final response = await http.get(Uri.parse(urlTask + id));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'];
        print(parsed);
        // return parsed.map<Datum>((json) => Datum.fromJson(json)).toList();
        return parsed;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
