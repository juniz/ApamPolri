import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/services/request.dart';
import 'package:apam/services/url.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  void apiLogin() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    Request request = Request(
        url: urlLogin,
        body: {
          'no_rkm_medis': emailTextController.text,
          'no_ktp': passwordTextController.text
        },
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"));
    request.post().then((value) {
      var res = jsonDecode(value.body);
      print(res);
      if (res['state'] == 'valid') {
        Get.back();
        Get.offAllNamed("/dashboard");
      } else {
        Get.back();
      }
    }).catchError((onError) {});
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}
