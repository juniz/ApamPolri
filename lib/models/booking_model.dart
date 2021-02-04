// To parse this JSON data, do
//
//     final booking = bookingFromJson(jsonString);

import 'dart:convert';

Booking bookingFromJson(String str) => Booking.fromJson(json.decode(str));

String bookingToJson(Booking data) => json.encode(data.toJson());

class Booking {
  Booking({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<BookingList> data;
  String message;

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        success: json["success"],
        data: List<BookingList>.from(
            json["data"].map((x) => BookingList.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class BookingList {
  BookingList({
    this.tanggalBooking,
    this.tanggalPeriksa,
    this.noReg,
    this.status,
    this.nmPoli,
    this.nmDokter,
    this.pngJawab,
  });

  DateTime tanggalBooking;
  DateTime tanggalPeriksa;
  String noReg;
  String status;
  String nmPoli;
  String nmDokter;
  String pngJawab;

  factory BookingList.fromJson(Map<String, dynamic> json) => BookingList(
        tanggalBooking: DateTime.parse(json["tanggal_booking"]),
        tanggalPeriksa: DateTime.parse(json["tanggal_periksa"]),
        noReg: json["no_reg"],
        status: json["status"],
        nmPoli: json["nm_poli"],
        nmDokter: json["nm_dokter"],
        pngJawab: json["png_jawab"],
      );

  Map<String, dynamic> toJson() => {
        "tanggal_booking":
            "${tanggalBooking.year.toString().padLeft(4, '0')}-${tanggalBooking.month.toString().padLeft(2, '0')}-${tanggalBooking.day.toString().padLeft(2, '0')}",
        "tanggal_periksa":
            "${tanggalPeriksa.year.toString().padLeft(4, '0')}-${tanggalPeriksa.month.toString().padLeft(2, '0')}-${tanggalPeriksa.day.toString().padLeft(2, '0')}",
        "no_reg": noReg,
        "status": statusValues.reverse[status],
        "nm_poli": nmPoli,
        "nm_dokter": nmDokter,
        "png_jawab": pngJawab,
      };
}

enum Status { TERDAFTAR, DOKTER_BERHALANGAN }

final statusValues = EnumValues({
  "Dokter Berhalangan": Status.DOKTER_BERHALANGAN,
  "Terdaftar": Status.TERDAFTAR
});

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
