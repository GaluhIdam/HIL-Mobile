// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

TaskResponse taskFromJson(String str) =>
    TaskResponse.fromJson(json.decode(str));

String taskToJson(TaskResponse data) => json.encode(data.toJson());

class TaskResponse {
  TaskResponse({
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
  List<Task> data;
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

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
        currentPage: json["current_page"],
        data: List<Task>.from(json["data"].map((x) => Task.fromJson(x))),
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
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
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

class Task {
  Task({
    required this.itemId,
    required this.subject,
    required this.description,
    required this.acreg,
    required this.dateOccur,
    required this.dateInsert,
    required this.dueDate,
    required this.dateClose,
  });

  String itemId;
  String subject;
  String description;
  String acreg;
  DateTime dateOccur;
  DateTime dateInsert;
  DateTime dueDate;
  DateTime dateClose;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        itemId: json["itemID"],
        subject: json["Subject"],
        description: json["Description"],
        acreg: json["acreg"],
        dateOccur: DateTime.parse(json["DateOccur"]),
        dateInsert: DateTime.parse(json["DateInsert"]),
        dueDate: DateTime.parse(json["DueDate"]),
        dateClose: DateTime.parse(json["DateClose"]),
      );

  Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "Subject": subject,
        "Description": description,
        "acreg": acreg,
        "DateOccur": dateOccur.toIso8601String(),
        "DateInsert": dateInsert.toIso8601String(),
        "DueDate": dueDate.toIso8601String(),
        "DateClose": dateClose.toIso8601String(),
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
