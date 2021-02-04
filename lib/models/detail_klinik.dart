// To parse this JSON data, do
//
//     final detailKlinik = detailKlinikFromJson(jsonString);

import 'dart:convert';

DetailKlinik detailKlinikFromJson(String str) =>
    DetailKlinik.fromJson(json.decode(str));

String detailKlinikToJson(DetailKlinik data) => json.encode(data.toJson());

class DetailKlinik {
  DetailKlinik({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<DetailKlinikList> data;
  String message;

  factory DetailKlinik.fromJson(Map<String, dynamic> json) => DetailKlinik(
        success: json["success"],
        data: List<DetailKlinikList>.from(
            json["data"].map((x) => DetailKlinikList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DetailKlinikList {
  DetailKlinikList({
    this.hariKerja,
    this.nmDokter,
    this.jamMulai,
    this.jamSelesai,
  });

  String hariKerja;
  String nmDokter;
  String jamMulai;
  String jamSelesai;

  factory DetailKlinikList.fromJson(Map<String, dynamic> json) =>
      DetailKlinikList(
        hariKerja: json["hari_kerja"],
        nmDokter: json["nm_dokter"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "hari_kerja": hariKerja,
        "nm_dokter": nmDokter,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
      };
}
