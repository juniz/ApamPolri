// To parse this JSON data, do
//
//     final kamar = kamarFromJson(jsonString);

import 'dart:convert';

Kamar kamarFromJson(String str) => Kamar.fromJson(json.decode(str));

String kamarToJson(Kamar data) => json.encode(data.toJson());

class Kamar {
  Kamar({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<KamarList> data;
  String message;

  factory Kamar.fromJson(Map<String, dynamic> json) => Kamar(
        success: json["success"],
        data: List<KamarList>.from(
            json["data"].map((x) => KamarList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class KamarList {
  KamarList({
    this.kelas,
    this.total,
    this.isi,
    this.kosong,
  });

  String kelas;
  int total;
  int isi;
  int kosong;

  factory KamarList.fromJson(Map<String, dynamic> json) => KamarList(
        kelas: json["kelas"],
        total: json["total"],
        isi: json["isi"],
        kosong: json["kosong"],
      );

  Map<String, dynamic> toJson() => {
        "kelas": kelas,
        "total": total,
        "isi": isi,
        "kosong": kosong,
      };
}
