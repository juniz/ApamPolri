import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.nrp,
    this.nama,
    this.jk,
    this.alamat,
    this.tglLahir,
  });

  String nrp;
  String nama;
  String jk;
  String alamat;
  DateTime tglLahir;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        nrp: json["nrp"],
        nama: json["nama"],
        jk: json["jk"],
        alamat: json["alamat"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
      );

  Map<String, dynamic> toJson() => {
        "nrp": nrp,
        "nama": nama,
        "jk": jk,
        "alamat": alamat,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
      };
}
