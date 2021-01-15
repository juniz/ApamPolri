// To parse this JSON data, do
//
//     final detailKlinik = detailKlinikFromJson(jsonString);

import 'dart:convert';

List<DetailKlinik> detailKlinikFromJson(String str) => List<DetailKlinik>.from(
    json.decode(str).map((x) => DetailKlinik.fromJson(x)));

String detailKlinikToJson(List<DetailKlinik> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailKlinik {
  DetailKlinik({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.hariKerja,
    this.nmDokter,
    this.jamMulai,
    this.jamSelesai,
  });

  String the0;
  String the1;
  String the2;
  String the3;
  String hariKerja;
  String nmDokter;
  String jamMulai;
  String jamSelesai;

  factory DetailKlinik.fromJson(Map<String, dynamic> json) => DetailKlinik(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        hariKerja: json["hari_kerja"],
        nmDokter: json["nm_dokter"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3": the3,
        "hari_kerja": hariKerja,
        "nm_dokter": nmDokter,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
      };
}
