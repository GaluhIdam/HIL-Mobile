// To parserequired this JSON data, do
//
//     final customer = customerFromJson(jsonString);

import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  Customer({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  String message;
  DataCustomer data;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        status: json["status"],
        message: json["message"],
        data: DataCustomer.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class DataCustomer {
  DataCustomer({
    required this.ga,
    required this.qg,
  });

  String ga;
  String qg;

  factory DataCustomer.fromJson(Map<String, dynamic> json) => DataCustomer(
        ga: json["GA"],
        qg: json["QG"],
      );

  Map<String, dynamic> toJson() => {
        "GA": ga,
        "QG": qg,
      };
}
