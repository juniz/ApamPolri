// To parse this JSON data, do
//
//     final detailDokter = detailDokterFromJson(jsonString);

import 'dart:convert';

List<DetailDokter> detailDokterFromJson(String str) => List<DetailDokter>.from(
    json.decode(str).map((x) => DetailDokter.fromJson(x)));

String detailDokterToJson(List<DetailDokter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailDokter {
  DetailDokter({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.hariKerja,
    this.nmPoli,
    this.jamMulai,
    this.jamSelesai,
  });

  String the0;
  String the1;
  String the2;
  String the3;
  String hariKerja;
  String nmPoli;
  String jamMulai;
  String jamSelesai;

  factory DetailDokter.fromJson(Map<String, dynamic> json) => DetailDokter(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        hariKerja: json["hari_kerja"],
        nmPoli: json["nm_poli"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3": the3,
        "hari_kerja": hariKerja,
        "nm_poli": nmPoli,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
      };
}
