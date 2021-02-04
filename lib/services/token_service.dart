import 'dart:convert';

import 'package:apam/models/token_model.dart';
import 'package:http/http.dart' as http;

class TokenServices {
  final String url;
  final String username;
  final String password;

  TokenServices(this.url, this.username, this.password);

  Future<String> getToken() async {
    try {
      http.Response response = await http.post(
        url,
        body: {'username': username, 'password': password},
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );

      var data = tokenFromJson(response.body).data;
      return data.token;
    } on Exception catch (e) {
      print(e);
      return e.toString();
    }
  }
}
