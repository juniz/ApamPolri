// To parse this JSON data, do
//
//     final riwayatHomeCare = riwayatHomeCareFromJson(jsonString);

import 'dart:convert';

List<RiwayatHomeCare> riwayatHomeCareFromJson(String str) =>
    List<RiwayatHomeCare>.from(
        json.decode(str).map((x) => RiwayatHomeCare.fromJson(x)));

String riwayatHomeCareToJson(List<RiwayatHomeCare> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RiwayatHomeCare {
  RiwayatHomeCare({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.nrp,
    this.nmDokter,
    this.nmPoli,
    this.tgl,
  });

  String the0;
  String the1;
  String the2;
  DateTime the3;
  String nrp;
  String nmDokter;
  String nmPoli;
  DateTime tgl;

  factory RiwayatHomeCare.fromJson(Map<String, dynamic> json) =>
      RiwayatHomeCare(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: DateTime.parse(json["3"]),
        nrp: json["nrp"],
        nmDokter: json["nm_dokter"],
        nmPoli: json["nm_poli"],
        tgl: DateTime.parse(json["tgl"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3":
            "${the3.year.toString().padLeft(4, '0')}-${the3.month.toString().padLeft(2, '0')}-${the3.day.toString().padLeft(2, '0')}",
        "nrp": nrp,
        "nm_dokter": nmDokter,
        "nm_poli": nmPoli,
        "tgl":
            "${tgl.year.toString().padLeft(4, '0')}-${tgl.month.toString().padLeft(2, '0')}-${tgl.day.toString().padLeft(2, '0')}",
      };
}
