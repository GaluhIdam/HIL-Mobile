import 'dart:convert';

OptionResponse taskFromJson(String str) =>
    OptionResponse.fromJson(json.decode(str));

String taskToJson(OptionResponse data) => json.encode(data.toJson());

class OptionResponse {
  OptionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  List<Option> data;

  factory OptionResponse.fromJson(Map<String, dynamic> json) => OptionResponse(
        status: json["status"],
        message: json["message"],
        data: List<Option>.from(json["data"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    required this.statusNo,
    required this.statusDesc,
  });

  String statusNo;
  String statusDesc;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        statusNo: json["StatusNo"],
        statusDesc: json["StatusDesc"],
      );

  Map<String, dynamic> toJson() => {
        "StatusNo": statusNo,
        "StatusDesc": statusDesc,
      };
}
