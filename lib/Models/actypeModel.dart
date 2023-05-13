import 'dart:convert';

AcTypeData acTypeDataFromJson(String str) =>
    AcTypeData.fromJson(json.decode(str));

String acTypeDataToJson(AcTypeData data) => json.encode(data.toJson());

class AcTypeData {
  AcTypeData({
    required this.data,
  });

  List<DataACType> data;

  factory AcTypeData.fromJson(Map<String, dynamic> json) => AcTypeData(
        data: List<DataACType>.from(
            json["data"].map((x) => DataACType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataACType {
  DataACType({
    required this.acTypeId,
    required this.acType,
    required this.engineQty,
    required this.acTypeUmr,
    required this.acTypeUmr1,
    required this.acTypeId2,
    required this.bodyType,
    required this.nopeg,
    required this.currentDate,
    required this.status,
  });

  String? acTypeId;
  String? acType;
  String? engineQty;
  String? acTypeUmr;
  String? acTypeUmr1;
  String? acTypeId2;
  String? bodyType;
  String? nopeg;
  dynamic currentDate;
  String? status;

  factory DataACType.fromJson(Map<String, dynamic> json) => DataACType(
        acTypeId: json["ACTypeID"],
        acType: json["ACType"],
        engineQty: json["EngineQty"],
        acTypeUmr: json["ACTypeUMR"],
        acTypeUmr1: json["ACTypeUMR1"],
        acTypeId2: json["ACTypeID2"],
        bodyType: json["bodyType"],
        nopeg: json["nopeg"],
        currentDate: json["currentDate"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "ACTypeID": acTypeId,
        "ACType": acType,
        "EngineQty": engineQty,
        "ACTypeUMR": acTypeUmr,
        "ACTypeUMR1": acTypeUmr1,
        "ACTypeID2": acTypeId2,
        "bodyType": bodyType,
        "nopeg": nopeg,
        "currentDate": currentDate,
        "status": status,
      };

  userAsStringByName() {}

  userAsString() {}
}
