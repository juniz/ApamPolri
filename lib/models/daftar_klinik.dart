// To parse this JSON data, do
//
//     final daftarKlinik = daftarKlinikFromJson(jsonString);

import 'dart:convert';

List<DaftarKlinik> daftarKlinikFromJson(String str) => List<DaftarKlinik>.from(
    json.decode(str).map((x) => DaftarKlinik.fromJson(x)));

String daftarKlinikToJson(List<DaftarKlinik> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DaftarKlinik {
  DaftarKlinik({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.kdPoli,
    this.nmPoli,
    this.registrasi,
    this.registrasilama,
    this.status,
  });

  String the0;
  String the1;
  String the2;
  String the3;
  String the4;
  String kdPoli;
  String nmPoli;
  String registrasi;
  String registrasilama;
  String status;

  factory DaftarKlinik.fromJson(Map<String, dynamic> json) => DaftarKlinik(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        kdPoli: json["kd_poli"],
        nmPoli: json["nm_poli"],
        registrasi: json["registrasi"],
        registrasilama: json["registrasilama"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3": the3,
        "4": the4,
        "kd_poli": kdPoli,
        "nm_poli": nmPoli,
        "registrasi": registrasi,
        "registrasilama": registrasilama,
        "status": status,
      };
}
