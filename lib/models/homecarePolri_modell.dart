// To parse this JSON data, do
//
//     final homecarePolri = homecarePolriFromJson(jsonString);

import 'dart:convert';

HomecarePolri homecarePolriFromJson(String str) =>
    HomecarePolri.fromJson(json.decode(str));

String homecarePolriToJson(HomecarePolri data) => json.encode(data.toJson());

class HomecarePolri {
  HomecarePolri({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<HomecarePolriData> data;
  String message;

  factory HomecarePolri.fromJson(Map<String, dynamic> json) => HomecarePolri(
        success: json["success"],
        data: List<HomecarePolriData>.from(
            json["data"].map((x) => HomecarePolriData.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class HomecarePolriData {
  HomecarePolriData({
    this.nama,
    this.tanggalBooking,
    this.jamBooking,
    this.tanggalPeriksa,
    this.nmDokter,
    this.status,
  });

  String nama;
  DateTime tanggalBooking;
  String jamBooking;
  DateTime tanggalPeriksa;
  String nmDokter;
  String status;

  factory HomecarePolriData.fromJson(Map<String, dynamic> json) =>
      HomecarePolriData(
        nama: json["nama"],
        tanggalBooking: DateTime.parse(json["tanggal_booking"]),
        jamBooking: json["jam_booking"],
        tanggalPeriksa: DateTime.parse(json["tanggal_periksa"]),
        nmDokter: json["nm_dokter"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "tanggal_booking":
            "${tanggalBooking.year.toString().padLeft(4, '0')}-${tanggalBooking.month.toString().padLeft(2, '0')}-${tanggalBooking.day.toString().padLeft(2, '0')}",
        "jam_booking": jamBooking,
        "tanggal_periksa":
            "${tanggalPeriksa.year.toString().padLeft(4, '0')}-${tanggalPeriksa.month.toString().padLeft(2, '0')}-${tanggalPeriksa.day.toString().padLeft(2, '0')}",
        "nm_dokter": nmDokter,
        "status": status,
      };
}
