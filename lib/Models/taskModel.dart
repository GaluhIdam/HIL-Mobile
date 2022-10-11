// To parserequired this JSON data, do
//
//     final taskListResponse = taskListResponseFromJson(jsonString);

import 'dart:convert';

TaskListResponse taskListResponseFromJson(String str) =>
    TaskListResponse.fromJson(json.decode(str));

String taskListResponseToJson(TaskListResponse data) =>
    json.encode(data.toJson());

class TaskListResponse {
  TaskListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  Data data;

  factory TaskListResponse.fromJson(Map<String, dynamic> json) =>
      TaskListResponse(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<Map<String, String>> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Map<String, String>>.from(json["data"].map((x) => Map.from(x)
            .map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => Map.from(x).map(
            (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}

TaskList taskListFromJson(String str) => TaskList.fromJson(json.decode(str));

String taskListToJson(TaskList data) => json.encode(data.toJson());

class TaskList {
  TaskList({
    required this.data,
  });

  List<TaskListData> data;

  factory TaskList.fromJson(Map<String, dynamic> json) => TaskList(
        data: List<TaskListData>.from(
            json["data"].map((x) => TaskListData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

TaskListData taskListDataFromJson(String str) =>
    TaskListData.fromJson(json.decode(str));

String taskListDataToJson(TaskListData data) => json.encode(data.toJson());

class TaskListData {
  TaskListData({
    required this.itemId,
    required this.subject,
    required this.description,
    required this.dateoccur,
    required this.duedate,
    required this.flightNo,
    required this.status,
    required this.category,
    required this.acreg,
    required this.sta,
    required this.optionId,
    required this.actypeid,
    required this.priorityId,
    required this.dueStatus,
    required this.priority,
    required this.lastFollow,
    required this.categoryText,
    required this.shortName,
    required this.customer,
  });

  String itemId;
  String subject;
  String description;
  DateTime dateoccur;
  DateTime duedate;
  String flightNo;
  String status;
  String? category;
  String acreg;
  String? sta;
  dynamic optionId;
  String actypeid;
  String priorityId;
  String dueStatus;
  String priority;
  dynamic lastFollow;
  String categoryText;
  String shortName;
  String customer;

  factory TaskListData.fromJson(Map<String, dynamic> json) => TaskListData(
        itemId: json["itemID"],
        subject: json["Subject"],
        description: json["Description"],
        dateoccur: DateTime.parse(json["Dateoccur"]),
        duedate: DateTime.parse(json["Duedate"]),
        flightNo: json["FlightNo"],
        status: json["Status"],
        category: json["Category"],
        acreg: json["acreg"],
        sta: json["sta"],
        optionId: json["optionID"],
        actypeid: json["actypeid"],
        priorityId: json["priorityID"],
        dueStatus: json["dueStatus"],
        priority: json["priority"],
        lastFollow: json["last_follow"],
        categoryText: json["category_text"],
        shortName: json["short_name"],
        customer: json["customer"],
      );

  Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "Subject": subject,
        "Description": description,
        "Dateoccur": dateoccur.toIso8601String(),
        "Duedate": duedate.toIso8601String(),
        "FlightNo": flightNo,
        "Status": status,
        "Category": category,
        "acreg": acreg,
        "sta": sta,
        "optionID": optionId,
        "actypeid": actypeid,
        "priorityID": priorityId,
        "dueStatus": dueStatus,
        "priority": priority,
        "last_follow": lastFollow,
        "category_text": categoryText,
        "short_name": shortName,
        "customer": customer,
      };
}
