// To parserequired this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.success,
    required this.message,
    required this.errors,
  });

  bool success;
  String message;
  Errors errors;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  Errors({
    required this.username,
    required this.password,
  });

  List<String> username;
  List<String> password;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        username: List<String>.from(json["username"].map((x) => x)),
        password: List<String>.from(json["password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "username": List<dynamic>.from(username.map((x) => x)),
        "password": List<dynamic>.from(password.map((x) => x)),
      };
}
