// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  DataProfile data;
  String message;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        success: json["success"],
        data: DataProfile.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class DataProfile {
  DataProfile({
    this.nrp,
    this.ktp,
    this.nama,
    this.jk,
    this.email,
    this.telp,
    this.satuan,
    this.stts,
    this.otp,
  });

  String nrp;
  String ktp;
  String nama;
  String jk;
  String email;
  String telp;
  String satuan;
  String stts;
  String otp;

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        nrp: json["nrp"],
        ktp: json["ktp"],
        nama: json["nama"],
        jk: json["jk"],
        email: json["email"],
        telp: json["telp"],
        satuan: json["satuan"],
        stts: json["stts"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "nrp": nrp,
        "ktp": ktp,
        "nama": nama,
        "jk": jk,
        "email": email,
        "telp": telp,
        "satuan": satuan,
        "stts": stts,
        "otp": otp,
      };
}
