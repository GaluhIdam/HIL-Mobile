// To parserequired this JSON data, do
//
//     final acregDataList = acregDataListFromJson(jsonString);

import 'dart:convert';

AcregDataList acregDataListFromJson(String str) =>
    AcregDataList.fromJson(json.decode(str));

String acregDataListToJson(AcregDataList data) => json.encode(data.toJson());

class AcregDataList {
  AcregDataList({
    required this.data,
  });

  List<DataAcreg> data;

  factory AcregDataList.fromJson(Map<String, dynamic> json) => AcregDataList(
        data: List<DataAcreg>.from(
            json["data"].map((x) => DataAcreg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataAcreg {
  DataAcreg({
    required this.acreg,
    required this.actypeId,
    required this.acid,
    required this.func,
    required this.mandt,
    required this.sn,
    required this.own,
    required this.vsn,
    required this.esn,
    required this.cec,
    required this.msn,
    required this.status,
    required this.apuType,
    required this.engineType,
    required this.dt,
    required this.ln,
    required this.fh,
    required this.fc,
    required this.mfgDate,
    required this.acStat,
    required this.nopeg,
    required this.currentDate,
    required this.groupActype,
  });

  dynamic acreg;
  dynamic actypeId;
  dynamic acid;
  dynamic func;
  dynamic mandt;
  dynamic sn;
  dynamic own;
  dynamic vsn;
  dynamic esn;
  dynamic cec;
  dynamic msn;
  dynamic status;
  dynamic apuType;
  dynamic engineType;
  dynamic dt;
  dynamic ln;
  dynamic fh;
  dynamic fc;
  dynamic mfgDate;
  dynamic acStat;
  dynamic nopeg;
  dynamic currentDate;
  dynamic groupActype;

  factory DataAcreg.fromJson(Map<String, dynamic> json) => DataAcreg(
        acreg: json["acreg"],
        actypeId: json["actypeID"],
        acid: json["ACID"],
        func: json["Func"],
        mandt: json["MANDT"],
        sn: json["SN"],
        own: json["Own"],
        vsn: json["vsn"],
        esn: json["esn"],
        cec: json["cec"],
        msn: json["msn"],
        status: json["status"],
        apuType: json["APUType"],
        engineType: json["EngineType"],
        dt: json["DT"],
        ln: json["ln"],
        fh: json["fh"],
        fc: json["fc"],
        mfgDate: json["MFG_DATE"],
        acStat: json["ac_stat"],
        nopeg: json["nopeg"],
        currentDate: json["currentDate"],
        groupActype: json["group_actype"],
      );

  Map<String, dynamic> toJson() => {
        "acreg": acreg,
        "actypeID": actypeId,
        "ACID": acid,
        "Func": func,
        "MANDT": mandt,
        "SN": sn,
        "Own": own,
        "vsn": vsn,
        "esn": esn,
        "cec": cec,
        "msn": msn,
        "status": status,
        "APUType": apuType,
        "EngineType": engineType,
        "DT": dt,
        "ln": ln,
        "fh": fh,
        "fc": fc,
        "MFG_DATE": mfgDate,
        "ac_stat": acStat,
        "nopeg": nopeg,
        "currentDate": currentDate,
        "group_actype": groupActype,
      };
}
