import 'dart:convert';

import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/models/detail_klinik.dart';
import 'package:apam/services/url.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailKlinikController extends GetxController {
  DashboardController dashboardController;
  var detailKlinik = List<DetailKlinik>().obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    fetchJadwal();
    super.onInit();
  }

  Future<List<DetailKlinik>> fetchJadwal() async {
    try {
      Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false),
      );
      http.Response response = await http.post(
        urlBase,
        body: {
          'action': 'detailklinik',
          'kd_poli': dashboardController.kdPoli.value
        },
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = detailKlinikFromJson(response.body);
      detailKlinik.value = data;
      Get.back();
    } on Exception catch (e) {
      Get.back();
      PopUpDialog.dialogWidget('Tidak Dapat Terhubung dengan Server');
    }
  }
}
