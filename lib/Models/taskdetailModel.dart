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
    required this.dueStatus,
    required this.subject,
    required this.flightNumber,
    required this.aCType,
    required this.aCRegistration,
    required this.station,
    required this.ata,
    required this.seqNumber,
    required this.techlog,
    required this.ref,
    required this.refDdg,
    required this.dateOccur,
    required this.dueDate,
    required this.stationCode,
    required this.faultCode,
    required this.category,
    required this.optionStatus,
    required this.description,
    required this.partNumber,
    required this.partName,
    required this.reason,
  });

  String itemId;
  DateTime dueStatus;
  String subject;
  String flightNumber;
  String aCType;
  String aCRegistration;
  String station;
  String ata;
  String seqNumber;
  String techlog;
  String ref;
  String refDdg;
  DateTime dateOccur;
  DateTime dueDate;
  String stationCode;
  String faultCode;
  String category;
  dynamic optionStatus;
  String description;
  dynamic partNumber;
  dynamic partName;
  dynamic reason;

  factory TaskDetailData.fromJson(Map<String, dynamic> json) => TaskDetailData(
        itemId: json["Item ID"],
        dueStatus: DateTime.parse(json["Due Status"]),
        subject: json["Subject"],
        flightNumber: json["Flight Number"],
        aCType: json["A/C Type"],
        aCRegistration: json["A/C Registration"],
        station: json["Station"],
        ata: json["ATA"],
        seqNumber: json["Seq.Number"],
        techlog: json["TECHLOG"],
        ref: json["REF"],
        refDdg: json["REF.DDG"],
        dateOccur: DateTime.parse(json["Date Occur"]),
        dueDate: DateTime.parse(json["Due Date"]),
        stationCode: json["Station Code"],
        faultCode: json["Fault Code"],
        category: json["Category"],
        optionStatus: json["Option Status"],
        description: json["Description"],
        partNumber: json["Part Number"],
        partName: json["Part Name"],
        reason: json["Reason"],
      );

  Map<String, dynamic> toJson() => {
        "Item ID": itemId,
        "Due Status":
            "${dueStatus.year.toString().padLeft(4, '0')}-${dueStatus.month.toString().padLeft(2, '0')}-${dueStatus.day.toString().padLeft(2, '0')}",
        "Subject": subject,
        "Flight Number": flightNumber,
        "A/C Type": aCType,
        "A/C Registration": aCRegistration,
        "Station": station,
        "ATA": ata,
        "Seq.Number": seqNumber,
        "TECHLOG": techlog,
        "REF": ref,
        "REF.DDG": refDdg,
        "Date Occur":
            "${dateOccur.year.toString().padLeft(4, '0')}-${dateOccur.month.toString().padLeft(2, '0')}-${dateOccur.day.toString().padLeft(2, '0')}",
        "Due Date":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "Station Code": stationCode,
        "Fault Code": faultCode,
        "Category": category,
        "Option Status": optionStatus,
        "Description": description,
        "Part Number": partNumber,
        "Part Name": partName,
        "Reason": reason,
      };
}
