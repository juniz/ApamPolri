// To parse this JSON data, do
//
//     final jadwalDokter = jadwalDokterFromJson(jsonString);

import 'dart:convert';

JadwalDokter jadwalDokterFromJson(String str) =>
    JadwalDokter.fromJson(json.decode(str));

String jadwalDokterToJson(JadwalDokter data) => json.encode(data.toJson());

class JadwalDokter {
  JadwalDokter({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<JadwalDokterList> data;
  String message;

  factory JadwalDokter.fromJson(Map<String, dynamic> json) => JadwalDokter(
        success: json["success"],
        data: List<JadwalDokterList>.from(
            json["data"].map((x) => JadwalDokterList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class JadwalDokterList {
  JadwalDokterList({
    this.kdDokter,
    this.nmDokter,
  });

  String kdDokter;
  String nmDokter;

  factory JadwalDokterList.fromJson(Map<String, dynamic> json) =>
      JadwalDokterList(
        kdDokter: json["kd_dokter"],
        nmDokter: json["nm_dokter"],
      );

  Map<String, dynamic> toJson() => {
        "kd_dokter": kdDokter,
        "nm_dokter": nmDokter,
      };
}
