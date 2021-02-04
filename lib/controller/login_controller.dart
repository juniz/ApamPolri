import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apam/services/preference.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/services/request.dart';
import 'package:apam/services/url.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/token_model.dart';
import 'package:apam/models/login_model.dart';
import 'package:apam/services/token_service.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  TextEditingController rumkitController;

  var hasil = "".obs;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    rumkitController = TextEditingController();
    super.onInit();
  }

  Future apiLogin() async {
    if (rumkitController.text.contains('Nganjuk')) {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      try {
        var token = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        // print(token);
        http.Response response = await http.post(
          'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/pasien',
          body: {
            'nrp': emailTextController.text,
            'ktp': passwordTextController.text
          },
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer " + token
          },
          encoding: Encoding.getByName("utf-8"),
        );
        // var res = jsonDecode(response.body);
        var rkm = loginFromJson(response.body).data;
        if (response.statusCode == 200) {
          LocalData.savePref('no_rkm_medis', rkm.noRkmMedis);
          LocalData.savePref('token', token.toString());
          Get.back();
          hasil.value = 'valid';
        } else if (response.statusCode == 404) {
          Get.back();

          hasil.value = 'invalid';
          clearForm();
        }
      } on TimeoutException catch (e) {
        print('Timeout Error: $e');
        Get.back();
        hasil.value = 'timeout';
      } on SocketException catch (e) {
        print('Socket Error: $e');
        Get.back();
        hasil.value = 'socket';
      } on Error catch (e) {
        print('General Error: $e');
        Get.back();
        hasil.value = 'catch';
      }
    } else {
      hasil.value = 'notavailable';
    }
  }

  void clearForm() {
    emailTextController.text = "";
    passwordTextController.text = "";
    rumkitController.text = "";
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    rumkitController?.dispose();
    super.onClose();
  }
}
