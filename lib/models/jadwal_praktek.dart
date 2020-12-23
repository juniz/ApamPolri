import 'dart:convert';

List<JadwalPraktek> jadwalPraktekFromJson(String str) =>
    List<JadwalPraktek>.from(
        json.decode(str).map((x) => JadwalPraktek.fromJson(x)));

String jadwalPraktekToJson(List<JadwalPraktek> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JadwalPraktek {
  JadwalPraktek({
    this.nmDokter,
    this.jk,
    this.nmPoli,
    this.jamMulai,
    this.jamSelesai,
    this.kdDokter,
  });

  String nmDokter;
  Jk jk;
  String nmPoli;
  String jamMulai;
  String jamSelesai;
  String kdDokter;

  factory JadwalPraktek.fromJson(Map<String, dynamic> json) => JadwalPraktek(
        nmDokter: json["nm_dokter"],
        jk: jkValues.map[json["jk"]],
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
