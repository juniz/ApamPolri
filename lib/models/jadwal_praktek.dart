// To parse this JSON data, do
//
//     final jadwalPraktek = jadwalPraktekFromJson(jsonString);

import 'dart:convert';

JadwalPraktek jadwalPraktekFromJson(String str) =>
    JadwalPraktek.fromJson(json.decode(str));

String jadwalPraktekToJson(JadwalPraktek data) => json.encode(data.toJson());

class JadwalPraktek {
  JadwalPraktek({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<JadwalPraktekList> data;
  String message;

  factory JadwalPraktek.fromJson(Map<String, dynamic> json) => JadwalPraktek(
        success: json["success"],
        data: List<JadwalPraktekList>.from(
            json["data"].map((x) => JadwalPraktekList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class JadwalPraktekList {
  JadwalPraktekList({
    this.nmDokter,
    this.jk,
    this.nmPoli,
    this.jamMulai,
    this.jamSelesai,
    this.kdDokter,
  });

  String nmDokter;
  String jk;
  String nmPoli;
  String jamMulai;
  String jamSelesai;
  String kdDokter;

  factory JadwalPraktekList.fromJson(Map<String, dynamic> json) =>
      JadwalPraktekList(
        nmDokter: json["nm_dokter"],
        jk: json["jk"],
        nmPoli: json["nm_poli"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
        kdDokter: json["kd_dokter"],
      );

  Map<String, dynamic> toJson() => {
        "nm_dokter": nmDokter,
        "jk": jkValues.reverse[jk],
        "nm_poli": nmPoli,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
        "kd_dokter": kdDokter,
      };
}

enum Jk { P, L }

final jkValues = EnumValues({"L": Jk.L, "P": Jk.P});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
