// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  Token({
    this.success,
    this.data,
    this.message,
  });

  bool success;
  DataToken data;
  String message;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        success: json["success"],
        data: DataToken.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
      };
}

class DataToken {
  DataToken({
    this.token,
    this.name,
  });

  String token;
  String name;

  factory DataToken.fromJson(Map<String, dynamic> json) => DataToken(
        token: json["token"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
      };
}
