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
  static Future<List<TaskListData>> getTask() async {
    String urlTask = getURL() + 'task-list?page';
    try {
      final response = await http.get(Uri.parse(urlTask));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data']['data'].cast<Map<String, dynamic>>();
        return parsed
            .map<TaskListData>((json) => TaskListData.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load task list');
      }
    } catch (e) {
      throw Exception('Error to load task list');
    }
  }

//Get Detail Data
  static Future<List<TaskDetailData>> getTaskDetail(String id) async {
    String urlTask = getURL() + 'task-detail/';
    try {
      final response = await http.get(Uri.parse(urlTask + id));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed
            .map<TaskDetailData>((json) => TaskDetailData.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load task detail');
      }
    } catch (e) {
      throw Exception('Error to load task detail');
    }
  }
}
