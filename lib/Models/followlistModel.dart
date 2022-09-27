// To parserequired this JSON data, do
//
//     final followList = followListFromJson(jsonString);

import 'dart:convert';

FollowList followListFromJson(String str) =>
    FollowList.fromJson(json.decode(str));

String followListToJson(FollowList data) => json.encode(data.toJson());

class FollowList {
  FollowList({
    required this.data,
    required this.message,
    required this.success,
  });

  DataFollow data;
  String message;
  bool success;

  factory FollowList.fromJson(Map<String, dynamic> json) => FollowList(
        data: DataFollow.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "success": success,
      };
}

class DataFollow {
  DataFollow({
    required this.foid,
    required this.itemIdfo,
    required this.follow,
    required this.unitFo,
    required this.nameFo,
    required this.dateFo,
    required this.nextFo,
    required this.insertFo,
    required this.partName,
    required this.partNbr,
    required this.snIn,
    required this.sNout,
    required this.by,
    required this.reason,
    required this.countFollow,
    required this.insertDate,
  });

  int foid;
  String itemIdfo;
  String follow;
  String unitFo;
  dynamic nameFo;
  DateTime dateFo;
  dynamic nextFo;
  dynamic insertFo;
  dynamic partName;
  dynamic partNbr;
  dynamic snIn;
  dynamic sNout;
  dynamic by;
  dynamic reason;
  String countFollow;
  DateTime insertDate;

  factory DataFollow.fromJson(Map<String, dynamic> json) => DataFollow(
        foid: json["FOID"],
        itemIdfo: json["ItemIDFO"],
        follow: json["Follow"],
        unitFo: json["UnitFO"],
        nameFo: json["NameFO"],
        dateFo: DateTime.parse(json["DateFO"]),
        nextFo: json["NextFO"],
        insertFo: json["InsertFO"],
        partName: json["PartName"],
        partNbr: json["PartNbr"],
        snIn: json["SNIn"],
        sNout: json["SNout"],
        by: json["By"],
        reason: json["reason"],
        countFollow: json["CountFollow"],
        insertDate: DateTime.parse(json["insert_date"]),
      );

  Map<String, dynamic> toJson() => {
        "FOID": foid,
        "ItemIDFO": itemIdfo,
        "Follow": follow,
        "UnitFO": unitFo,
        "NameFO": nameFo,
        "DateFO": dateFo.toIso8601String(),
        "NextFO": nextFo,
        "InsertFO": insertFo,
        "PartName": partName,
        "PartNbr": partNbr,
        "SNIn": snIn,
        "SNout": sNout,
        "By": by,
        "reason": reason,
        "CountFollow": countFollow,
        "insert_date": insertDate.toIso8601String(),
      };
}
