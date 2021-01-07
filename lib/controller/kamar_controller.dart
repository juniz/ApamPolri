import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:apam/models/kamar_model.dart';
import 'package:apam/models/rsb_api_model.dart';
import 'package:apam/services/url.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class KamarController extends GetxController {
  var kamarList = List<Kamar>().obs;
  var isLoading = true.obs;
  var apiList = List<DataApi>().obs;

  @override
  void onInit() {
    //fetchKamar();
    super.onInit();
  }

  Future<List<DataApi>> fetchapi() async {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false),
    );
    var response = await http
        .get("http://10.0.2.2/rest-polri/public/index.php/rsb")
        .timeout(Duration(minutes: 2));
    apiList.value = rsbApiFromJson(response.body).data;
    Get.back();
  }

  void fetchKamar() async {
    try {
      isLoading(true);
      http.Response response = await http.post(
        urlBase,
        body: {'action': 'kamar'},
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = kamarFromJson(response.body);
      if (data != null) {
        kamarList.value = data;
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');

      PopUpDialog.dialogWidget('Waktu Koneksi Habis');
    } on SocketException catch (e) {
      print('Socket Error: $e');

      PopUpDialog.dialogWidget('Tidak Dapat Terhubung Internet');
    } on Error catch (e) {
      print('General Error: $e');

      PopUpDialog.dialogWidget('Terjadi Kesalahan');
    } finally {
      isLoading(false);
    }
  }
}
