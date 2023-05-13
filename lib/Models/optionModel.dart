// To parserequired this JSON data, do
//
//     final optionResponse = optionResponseFromJson(jsonString);

import 'dart:convert';

OptionResponse optionResponseFromJson(String str) =>
    OptionResponse.fromJson(json.decode(str));

String optionResponseToJson(OptionResponse data) => json.encode(data.toJson());

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
    required this.optionId,
    required this.shortName,
    required this.longName,
  });

  dynamic optionId;
  dynamic shortName;
  dynamic longName;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        optionId: json["optionID"],
        shortName: json["short_name"],
        longName: json["long_name"],
      );

  Map<String, dynamic> toJson() => {
        "optionID": optionId,
        "short_name": shortName,
        "long_name": longName,
      };
}
