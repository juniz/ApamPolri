// To parse this JSON data, do
//
//     final poliklinik = poliklinikFromJson(jsonString);

import 'dart:convert';

Poliklinik poliklinikFromJson(String str) =>
    Poliklinik.fromJson(json.decode(str));

String poliklinikToJson(Poliklinik data) => json.encode(data.toJson());

class Poliklinik {
  Poliklinik({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<PoliklinikList> data;
  String message;

  factory Poliklinik.fromJson(Map<String, dynamic> json) => Poliklinik(
        success: json["success"],
        data: List<PoliklinikList>.from(
            json["data"].map((x) => PoliklinikList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class PoliklinikList {
  PoliklinikList({
    this.kdPoli,
    this.nmPoli,
    this.jamMulai,
    this.jamSelesai,
  });

  String kdPoli;
  String nmPoli;
  String jamMulai;
  String jamSelesai;

  factory PoliklinikList.fromJson(Map<String, dynamic> json) => PoliklinikList(
        kdPoli: json["kd_poli"],
        nmPoli: json["nm_poli"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "kd_poli": kdPoli,
        "nm_poli": nmPoli,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
      };
}
