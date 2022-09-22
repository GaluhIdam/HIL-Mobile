// To parse required this JSON data, do
//
//     final taskDetail = taskDetailFromJson(jsonString);

import 'dart:convert';

TaskDetail taskDetailFromJson(String str) =>
    TaskDetail.fromJson(json.decode(str));

String taskDetailToJson(TaskDetail data) => json.encode(data.toJson());

class TaskDetail {
  TaskDetail({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<TaskDetailData> data;

  factory TaskDetail.fromJson(Map<String, dynamic> json) => TaskDetail(
        status: json["status"],
        message: json["message"],
        data: List<TaskDetailData>.from(
            json["data"].map((x) => TaskDetailData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TaskDetailData {
  TaskDetailData({
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

  factory TaskDetailData.fromJson(Map<String, dynamic> json) => TaskDetailData(
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
