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

    try {
      http.Response response = await http.post(
        urlBase + urlLogin,
        body: {
          'no_rkm_medis': emailTextController.text,
          'no_ktp': passwordTextController.text
        },
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var res = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (res['state'] == 'valid') {
          LocalData.savePref('no_rkm_medis', res['no_rkm_medis']);
          Get.back();
          Get.offAllNamed("/dashboard");
        } else {
          Get.back();
          PopUpDialog.dialogWidget('NRP Tidak Ditemukan');
        }
      } else {
        Get.back();
        PopUpDialog.dialogWidget('Terjadi Kesalahan');
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      Get.back();
      PopUpDialog.dialogWidget('Waktu Koneksi Habis');
    } on SocketException catch (e) {
      print('Socket Error: $e');
      Get.back();
      PopUpDialog.dialogWidget('Tidak Dapat Terhubung Internet');
    } on Error catch (e) {
      print('General Error: $e');
      Get.back();
      PopUpDialog.dialogWidget('Terjadi Kesalahan');
    }
  }

  @override
  void onClose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.onClose();
  }
}
