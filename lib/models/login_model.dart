// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  DataLogin data;
  String message;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        success: json["success"],
        data: DataLogin.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class DataLogin {
  DataLogin({
    this.nip,
    this.noKtp,
  });

  String nip;
  String noKtp;

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        nip: json["nrp"],
        noKtp: json["ktp"],
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "no_ktp": noKtp,
      };
}
