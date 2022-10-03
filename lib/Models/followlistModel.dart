// To parserequired this JSON data, do
//
//     final detailFollow = detailFollowFromJson(jsonString);

import 'dart:convert';

DetailFollow detailFollowFromJson(String str) => DetailFollow.fromJson(json.decode(str));

String detailFollowToJson(DetailFollow data) => json.encode(data.toJson());

class DetailFollow {
    DetailFollow({
       required this.data,
       required this.message,
       required this.success,
    });

    List<DetailFollowList> data;
    String message;
    bool success;

    factory DetailFollow.fromJson(Map<String, dynamic> json) => DetailFollow(
        data: List<DetailFollowList>.from(json["data"].map((x) => DetailFollowList.fromJson(x))),
        message: json["message"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "success": success,
    };
}

class DetailFollowList {
    DetailFollowList({
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
    dynamic itemIdfo;
    dynamic follow;
    dynamic unitFo;
    dynamic nameFo;
    dynamic dateFo;
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

    factory DetailFollowList.fromJson(Map<String, dynamic> json) => DetailFollowList(
        foid: json["FOID"],
        itemIdfo: json["ItemIDFO"],
        follow: json["Follow"],
        unitFo: json["UnitFO"],
        nameFo: json["NameFO"] == null ? null : json["NameFO"],
        dateFo: json["DateFO"],
        nextFo: json["NextFO"] == null ? null : json["NextFO"],
        insertFo: json["InsertFO"] == null ? null : json["InsertFO"],
        partName: json["PartName"] == null ? null : json["PartName"],
        partNbr: json["PartNbr"] == null ? null : json["PartNbr"],
        snIn: json["SNIn"] == null ? null : json["SNIn"],
        sNout: json["SNout"] == null ? null : json["SNout"],
        by: json["By"] == null ? null : json["By"],
        reason: json["reason"] == null ? null : json["reason"],
        countFollow: json["CountFollow"],
        insertDate: DateTime.parse(json["insert_date"]),
    );

    Map<String, dynamic> toJson() => {
        "FOID": foid,
        "ItemIDFO": itemIdfo,
        "Follow": follow,
        "UnitFO": unitFo,
        "NameFO": nameFo == null ? null : nameFo,
        "DateFO": dateFo,
        "NextFO": nextFo == null ? null : nextFo,
        "InsertFO": insertFo == null ? null : insertFo,
        "PartName": partName == null ? null : partName,
        "PartNbr": partNbr == null ? null : partNbr,
        "SNIn": snIn == null ? null : snIn,
        "SNout": sNout == null ? null : sNout,
        "By": by == null ? null : by,
        "reason": reason == null ? null : reason,
        "CountFollow": countFollow,
        "insert_date": insertDate.toIso8601String(),
    };
}
