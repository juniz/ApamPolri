// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

List<Booking> bookingFromJson(String str) =>
    List<Booking>.from(json.decode(str).map((x) => Booking.fromJson(x)));

String bookingToJson(List<Booking> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Booking {
  Booking({
    this.the0,
    this.the1,
    this.the2,
    this.the3,
    this.the4,
    this.the5,
    this.the6,
    this.tanggalBooking,
    this.tanggalPeriksa,
    this.noReg,
    this.status,
    this.nmPoli,
    this.nmDokter,
    this.pngJawab,
  });

  DateTime the0;
  DateTime the1;
  String the2;
  String the3;
  String the4;
  String the5;
  String the6;
  DateTime tanggalBooking;
  DateTime tanggalPeriksa;
  String noReg;
  String status;
  String nmPoli;
  String nmDokter;
  String pngJawab;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        the0: DateTime.parse(json["0"]),
        the1: DateTime.parse(json["1"]),
        the2: json["2"],
        the3: json["3"],
        the4: json["4"],
        the5: json["5"],
        the6: json["6"],
        tanggalBooking: DateTime.parse(json["tanggal_booking"]),
        tanggalPeriksa: DateTime.parse(json["tanggal_periksa"]),
        noReg: json["no_reg"],
        status: json["status"],
        nmPoli: json["nm_poli"],
        nmDokter: json["nm_dokter"],
        pngJawab: json["png_jawab"],
      );

  Map<String, dynamic> toJson() => {
        "0":
            "${the0.year.toString().padLeft(4, '0')}-${the0.month.toString().padLeft(2, '0')}-${the0.day.toString().padLeft(2, '0')}",
        "1":
            "${the1.year.toString().padLeft(4, '0')}-${the1.month.toString().padLeft(2, '0')}-${the1.day.toString().padLeft(2, '0')}",
        "2": the2,
        "3": the3,
        "4": the4,
        "5": the5,
        "6": the6,
        "tanggal_booking":
            "${tanggalBooking.year.toString().padLeft(4, '0')}-${tanggalBooking.month.toString().padLeft(2, '0')}-${tanggalBooking.day.toString().padLeft(2, '0')}",
        "tanggal_periksa":
            "${tanggalPeriksa.year.toString().padLeft(4, '0')}-${tanggalPeriksa.month.toString().padLeft(2, '0')}-${tanggalPeriksa.day.toString().padLeft(2, '0')}",
        "no_reg": noReg,
        "status": status,
        "nm_poli": nmPoli,
        "nm_dokter": nmDokter,
        "png_jawab": pngJawab,
      };
}
