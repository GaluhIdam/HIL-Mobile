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

class TaskListData {
  TaskListData({
    required this.itemId,
    required this.dateOccur,
    required this.dueDate,
    required this.dateInsert,
    required this.dateClose,
    required this.ddgRef,
    required this.flightNo,
    required this.ataNo,
    required this.seqNo,
    required this.sta,
    required this.staClose,
    required this.subject,
    required this.description,
    required this.category,
    required this.subAta,
    required this.insertProblem,
    required this.techlog,
    required this.status,
    required this.acreg,
    required this.acType,
    required this.statusNo,
    required this.statusDesc,
    required this.staId,
    required this.staCode,
    required this.optionId,
    required this.longName,
    required this.partNbr,
    required this.partName,
    required this.reason,
    required this.categoryDesc,
    required this.categoryCat,
  });

  dynamic itemId;
  dynamic dateOccur;
  dynamic dueDate;
  dynamic dateInsert;
  dynamic dateClose;
  dynamic ddgRef;
  dynamic flightNo;
  dynamic ataNo;
  dynamic seqNo;
  dynamic sta;
  dynamic staClose;
  dynamic subject;
  dynamic description;
  dynamic category;
  dynamic subAta;
  dynamic insertProblem;
  dynamic techlog;
  dynamic status;
  dynamic acreg;
  dynamic acType;
  dynamic statusNo;
  dynamic statusDesc;
  dynamic staId;
  dynamic staCode;
  dynamic optionId;
  dynamic longName;
  dynamic partNbr;
  dynamic partName;
  dynamic reason;
  dynamic categoryDesc;
  dynamic categoryCat;

  factory TaskListData.fromJson(Map<String, dynamic> json) => TaskListData(
        itemId: json["itemID"],
        dateOccur: json["DateOccur"],
        dueDate: json["DueDate"],
        dateInsert: json["DateInsert"],
        dateClose: json["DateClose"],
        ddgRef: json["DDGRef"],
        flightNo: json["FlightNo"],
        ataNo: json["ATANo"],
        seqNo: json["SeqNo"],
        sta: json["sta"],
        staClose: json["staClose"],
        subject: json["Subject"],
        description: json["Description"],
        category: json["Category"],
        subAta: json["sub_ata"],
        insertProblem: json["InsertProblem"],
        techlog: json["TECHLOG"],
        status: json["Status"],
        acreg: json["acreg"],
        acType: json["ACType"],
        statusNo: json["StatusNo"],
        statusDesc: json["StatusDesc"],
        staId: json["StaID"],
        staCode: json["StaCode"],
        optionId: json["optionID"],
        longName: json["long_name"],
        partNbr: json["PartNbr"],
        partName: json["PartName"],
        reason: json["reason"],
        categoryDesc: json["CategoryDesc"],
        categoryCat: json["CategoryCat"],
      );

  Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "DateOccur": dateOccur,
        "DueDate": dueDate,
        "DateInsert": dateInsert,
        "DateClose": dateClose,
        "DDGRef": ddgRef,
        "FlightNo": flightNo,
        "ATANo": ataNo,
        "SeqNo": seqNo,
        "sta": sta,
        "staClose": staClose,
        "Subject": subject,
        "Description": description,
        "Category": category,
        "sub_ata": subAta,
        "InsertProblem": insertProblem,
        "TECHLOG": techlog,
        "Status": status,
        "acreg": acreg,
        "ACType": acType,
        "StatusNo": statusNo,
        "StatusDesc": statusDesc,
        "StaID": staId,
        "StaCode": staCode,
        "optionID": optionId,
        "long_name": longName,
        "PartNbr": partNbr,
        "PartName": partName,
        "reason": reason,
        "CategoryDesc": categoryDesc,
      };
}
