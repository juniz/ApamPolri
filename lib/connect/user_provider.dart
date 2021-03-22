import 'package:get/get.dart';

class UserProvider extends GetConnect {
  Future<Response> getOTP(int id) => get('http://youapi/users/$id');
}
