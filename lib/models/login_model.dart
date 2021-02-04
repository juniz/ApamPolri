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
    this.noRkmMedis,
    this.nmPasien,
    this.nip,
    this.noKtp,
  });

  String noRkmMedis;
  String nmPasien;
  String nip;
  String noKtp;

  factory DataLogin.fromJson(Map<String, dynamic> json) => DataLogin(
        noRkmMedis: json["no_rkm_medis"],
        nmPasien: json["nm_pasien"],
        nip: json["nip"],
        noKtp: json["no_ktp"],
      );

  Map<String, dynamic> toJson() => {
        "no_rkm_medis": noRkmMedis,
        "nm_pasien": nmPasien,
        "nip": nip,
        "no_ktp": noKtp,
      };
}
