import 'dart:convert';

List<Poliklinik> poliklinikFromJson(String str) =>
    List<Poliklinik>.from(json.decode(str).map((x) => Poliklinik.fromJson(x)));

String poliklinikToJson(List<Poliklinik> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Poliklinik {
  Poliklinik({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.kdPoli,
    this.nmPoli,
    this.jamMulai,
    this.jamSelesai,
  });

  String the0;
  String the1;
  String the2;
  String the3;
  String kdPoli;
  String nmPoli;
  String jamMulai;
  String jamSelesai;

  factory Poliklinik.fromJson(Map<String, dynamic> json) => Poliklinik(
        the0: json["0"],
        the1: json["1"],
        the2: json["2"],
        the3: json["3"],
        kdPoli: json["kd_poli"],
        nmPoli: json["nm_poli"],
        jamMulai: json["jam_mulai"],
        jamSelesai: json["jam_selesai"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "2": the2,
        "3": the3,
        "kd_poli": kdPoli,
        "nm_poli": nmPoli,
        "jam_mulai": jamMulai,
        "jam_selesai": jamSelesai,
      };
}
