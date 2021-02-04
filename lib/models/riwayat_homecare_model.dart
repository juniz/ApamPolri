// To parse this JSON data, do
//
//     final riwayatHomeCare = riwayatHomeCareFromJson(jsonString);

import 'dart:convert';

RiwayatHomeCare riwayatHomeCareFromJson(String str) =>
    RiwayatHomeCare.fromJson(json.decode(str));

String riwayatHomeCareToJson(RiwayatHomeCare data) =>
    json.encode(data.toJson());

class RiwayatHomeCare {
  RiwayatHomeCare({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<RiwayatHomeCareList> data;
  String message;

  factory RiwayatHomeCare.fromJson(Map<String, dynamic> json) =>
      RiwayatHomeCare(
        success: json["success"],
        data: List<RiwayatHomeCareList>.from(
            json["data"].map((x) => RiwayatHomeCareList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class RiwayatHomeCareList {
  RiwayatHomeCareList({
    this.nrp,
    this.nmDokter,
    this.nmPoli,
    this.tgl,
  });

  String nrp;
  String nmDokter;
  String nmPoli;
  DateTime tgl;

  factory RiwayatHomeCareList.fromJson(Map<String, dynamic> json) =>
      RiwayatHomeCareList(
        nrp: json["nrp"],
        nmDokter: json["nm_dokter"],
        nmPoli: json["nm_poli"],
        tgl: DateTime.parse(json["tgl"]),
      );

  Map<String, dynamic> toJson() => {
        "nrp": nrp,
        "nm_dokter": nmDokter,
        "nm_poli": nmPoli,
        "tgl":
            "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
      };
}
