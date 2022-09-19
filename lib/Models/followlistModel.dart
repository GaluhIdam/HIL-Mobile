import 'dart:convert';

FollowListResponse followListResponseFromJson(String str) =>
    FollowListResponse.fromJson(json.decode(str));

String followListResponseToJson(FollowListResponse data) =>
    json.encode(data.toJson());

class FollowListResponse {
  FollowListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<FollowList> data;

  factory FollowListResponse.fromJson(Map<String, dynamic> json) =>
      FollowListResponse(
        status: json["status"],
        message: json["message"],
        data: List<FollowList>.from(
            json["data"].map((x) => FollowList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FollowList {
  FollowList({
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

  dynamic foid;
  dynamic itemIdfo;
  dynamic follow;
  dynamic unitFo;
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
  dynamic countFollow;
  DateTime insertDate;

  factory FollowList.fromJson(Map<String, dynamic> json) => FollowList(
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
