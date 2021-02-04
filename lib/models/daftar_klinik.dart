// To parse this JSON data, do
//
//     final daftarKlinik = daftarKlinikFromJson(jsonString);

import 'dart:convert';

DaftarKlinik daftarKlinikFromJson(String str) =>
    DaftarKlinik.fromJson(json.decode(str));

String daftarKlinikToJson(DaftarKlinik data) => json.encode(data.toJson());

class DaftarKlinik {
  DaftarKlinik({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<DataKlinikList> data;
  String message;

  factory DaftarKlinik.fromJson(Map<String, dynamic> json) => DaftarKlinik(
        success: json["success"],
        data: List<DataKlinikList>.from(
            json["data"].map((x) => DataKlinikList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataKlinikList {
  DataKlinikList({
    this.kdPoli,
    this.nmPoli,
    this.registrasi,
    this.registrasilama,
    this.status,
  });

  String kdPoli;
  String nmPoli;
  int registrasi;
  int registrasilama;
  String status;

  factory DataKlinikList.fromJson(Map<String, dynamic> json) => DataKlinikList(
        kdPoli: json["kd_poli"],
        nmPoli: json["nm_poli"],
        registrasi: json["registrasi"],
        registrasilama: json["registrasilama"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "kd_poli": kdPoli,
        "nm_poli": nmPoli,
        "registrasi": registrasi,
        "registrasilama": registrasilama,
        "status": status,
      };
}
