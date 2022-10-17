import 'dart:convert';
import 'dart:async';
import 'package:hil_mobile/Models/taskModel.dart';
import 'package:hil_mobile/Models/taskdetailModel.dart';
import 'package:hil_mobile/Services/config.dart';
import 'package:http/http.dart' as http;

class TaskService {
  static getURL() {
    return Config.baseURL;
  }

  //Get All Data to be List
  static Future<List<TaskListData>> getTask(String token) async {
    String urlTask = getURL() + 'task-list';
    final response = await http
        .get(Uri.parse(urlTask), headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = json['data']['data'];
      return parsed
          .map<TaskListData>((json) => TaskListData.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load task list');
    }
  }

//Get Detail Data
  static Future getTaskDetail(String id, token) async {
    String urlTask = getURL() + 'task-detail/';
    final response = await http.get(Uri.parse(urlTask + id),
        headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      final parsed = [json['data']];
      return parsed;
    } else {
      throw Exception('Failed to load task detail');
    }
  }
}
