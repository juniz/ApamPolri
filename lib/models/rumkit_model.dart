// To parse this JSON data, do
//
//     final rumkit = rumkitFromJson(jsonString);

import 'dart:convert';

Rumkit rumkitFromJson(String str) => Rumkit.fromJson(json.decode(str));

String rumkitToJson(Rumkit data) => json.encode(data.toJson());

class Rumkit {
  Rumkit({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  List<DataRumkit> data;
  String message;

  factory Rumkit.fromJson(Map<String, dynamic> json) => Rumkit(
        success: json["success"],
        data: List<DataRumkit>.from(
            json["data"].map((x) => DataRumkit.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DataRumkit {
  DataRumkit({
    this.id,
    this.rumkit,
    this.username,
    this.password,
    this.urlBase,
    this.urlBlog,
    this.telp,
    this.status,
  });

  int id;
  String rumkit;
  String username;
  String password;
  String urlBase;
  String urlBlog;
  String telp;
  String status;

  factory DataRumkit.fromJson(Map<String, dynamic> json) => DataRumkit(
        id: json["id"],
        rumkit: json["rumkit"],
        username: json["username"],
        password: json["password"],
        urlBase: json["urlBase"],
        urlBlog: json["urlBlog"],
        telp: json["telp"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rumkit": rumkit,
        "username": username,
        "password": password,
        "urlBase": urlBase,
        "urlBlog": urlBlog,
        "telp": telp,
        "status": status,
      };
}
