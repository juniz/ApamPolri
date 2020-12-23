import 'package:apam/services/url.dart';
import 'package:http/http.dart' as http;

class Request {
  final String url;
  final dynamic body;
  final dynamic headers;
  final dynamic encoding;

  Request({this.url, this.body, this.headers, this.encoding});

  Future<http.Response> post() {
    return http
        .post(urlBase + url, body: body, headers: headers, encoding: encoding)
        .timeout(Duration(minutes: 1));
  }

  Future<http.Response> get() {
    return http.get(urlBase + url).timeout(Duration(minutes: 1));
  }
}
