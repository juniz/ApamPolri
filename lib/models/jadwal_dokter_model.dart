import 'dart:convert';

List<JadwalDokter> jadwalDokterFromJson(String str) => List<JadwalDokter>.from(
    json.decode(str).map((x) => JadwalDokter.fromJson(x)));

String jadwalDokterToJson(List<JadwalDokter> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JadwalDokter {
  JadwalDokter({
    this.the0,
    this.the1,
    this.kdDokter,
    this.nmDokter,
  });

  String the0;
  String the1;
  String kdDokter;
  String nmDokter;

  factory JadwalDokter.fromJson(Map<String, dynamic> json) => JadwalDokter(
        the0: json["0"],
        the1: json["1"],
        kdDokter: json["kd_dokter"],
        nmDokter: json["nm_dokter"],
      );

  Map<String, dynamic> toJson() => {
        "0": the0,
        "1": the1,
        "kd_dokter": kdDokter,
        "nm_dokter": nmDokter,
      };
}
