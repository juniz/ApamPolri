// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.noRkmMedis,
    this.nmPasien,
    this.noKtp,
    this.jk,
    this.tmpLahir,
    this.tglLahir,
    this.nmIbu,
    this.alamat,
    this.golDarah,
    this.pekerjaan,
    this.sttsNikah,
    this.agama,
    this.tglDaftar,
    this.noTlp,
    this.umur,
    this.pnd,
    this.keluarga,
    this.namakeluarga,
    this.kdPj,
    this.noPeserta,
    this.kdKel,
    this.kdKec,
    this.kdKab,
    this.pekerjaanpj,
    this.alamatpj,
    this.kelurahanpj,
    this.kecamatanpj,
    this.kabupatenpj,
    this.perusahaanPasien,
    this.sukuBangsa,
    this.bahasaPasien,
    this.cacatFisik,
    this.email,
    this.nip,
    this.kdProp,
    this.propinsipj,
  });

  String noRkmMedis;
  String nmPasien;
  String noKtp;
  String jk;
  String tmpLahir;
  DateTime tglLahir;
  String nmIbu;
  String alamat;
  String golDarah;
  String pekerjaan;
  String sttsNikah;
  String agama;
  DateTime tglDaftar;
  String noTlp;
  String umur;
  String pnd;
  String keluarga;
  String namakeluarga;
  String kdPj;
  String noPeserta;
  String kdKel;
  String kdKec;
  String kdKab;
  String pekerjaanpj;
  String alamatpj;
  String kelurahanpj;
  String kecamatanpj;
  String kabupatenpj;
  String perusahaanPasien;
  String sukuBangsa;
  String bahasaPasien;
  String cacatFisik;
  String email;
  String nip;
  String kdProp;
  String propinsipj;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        noRkmMedis: json["no_rkm_medis"],
        nmPasien: json["nm_pasien"],
        noKtp: json["no_ktp"],
        jk: json["jk"],
        tmpLahir: json["tmp_lahir"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        nmIbu: json["nm_ibu"],
        alamat: json["alamat"],
        golDarah: json["gol_darah"],
        pekerjaan: json["pekerjaan"],
        sttsNikah: json["stts_nikah"],
        agama: json["agama"],
        tglDaftar: DateTime.parse(json["tgl_daftar"]),
        noTlp: json["no_tlp"],
        umur: json["umur"],
        pnd: json["pnd"],
        keluarga: json["keluarga"],
        namakeluarga: json["namakeluarga"],
        kdPj: json["kd_pj"],
        noPeserta: json["no_peserta"],
        kdKel: json["kd_kel"],
        kdKec: json["kd_kec"],
        kdKab: json["kd_kab"],
        pekerjaanpj: json["pekerjaanpj"],
        alamatpj: json["alamatpj"],
        kelurahanpj: json["kelurahanpj"],
        kecamatanpj: json["kecamatanpj"],
        kabupatenpj: json["kabupatenpj"],
        perusahaanPasien: json["perusahaan_pasien"],
        sukuBangsa: json["suku_bangsa"],
        bahasaPasien: json["bahasa_pasien"],
        cacatFisik: json["cacat_fisik"],
        email: json["email"],
        nip: json["nip"],
        kdProp: json["kd_prop"],
        propinsipj: json["propinsipj"],
      );

  Map<String, dynamic> toJson() => {
        "no_rkm_medis": noRkmMedis,
        "nm_pasien": nmPasien,
        "no_ktp": noKtp,
        "jk": jk,
        "tmp_lahir": tmpLahir,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "nm_ibu": nmIbu,
        "alamat": alamat,
        "gol_darah": golDarah,
        "pekerjaan": pekerjaan,
        "stts_nikah": sttsNikah,
        "agama": agama,
        "tgl_daftar":
            "${tglDaftar.year.toString().padLeft(4, '0')}-${tglDaftar.month.toString().padLeft(2, '0')}-${tglDaftar.day.toString().padLeft(2, '0')}",
        "no_tlp": noTlp,
        "umur": umur,
        "pnd": pnd,
        "keluarga": keluarga,
        "namakeluarga": namakeluarga,
        "kd_pj": kdPj,
        "no_peserta": noPeserta,
        "kd_kel": kdKel,
        "kd_kec": kdKec,
        "kd_kab": kdKab,
        "pekerjaanpj": pekerjaanpj,
        "alamatpj": alamatpj,
        "kelurahanpj": kelurahanpj,
        "kecamatanpj": kecamatanpj,
        "kabupatenpj": kabupatenpj,
        "perusahaan_pasien": perusahaanPasien,
        "suku_bangsa": sukuBangsa,
        "bahasa_pasien": bahasaPasien,
        "cacat_fisik": cacatFisik,
        "email": email,
        "nip": nip,
        "kd_prop": kdProp,
        "propinsipj": propinsipj,
      };
}
