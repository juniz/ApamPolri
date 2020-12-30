// To parse this JSON data, do
//
//     final rsbApi = rsbApiFromJson(jsonString);

import 'dart:convert';

RsbApi rsbApiFromJson(String str) => RsbApi.fromJson(json.decode(str));

String rsbApiToJson(RsbApi data) => json.encode(data.toJson());

class RsbApi {
  RsbApi({
    this.status,
    this.data,
  });

  bool status;
  List<DataApi> data;

  factory RsbApi.fromJson(Map<String, dynamic> json) => RsbApi(
        status: json["status"],
        data: List<DataApi>.from(json["data"].map((x) => DataApi.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DataApi {
  DataApi({
    this.id,
    this.nama,
    this.api,
  });

  int id;
  String nama;
  String api;

  factory DataApi.fromJson(Map<String, dynamic> json) => DataApi(
        id: json["id"],
        nama: json["nama"],
        api: json["api"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "api": api,
      };
}
