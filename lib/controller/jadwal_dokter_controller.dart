import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:apam/models/detail_dokter_model.dart';
import 'package:apam/models/jadwal_dokter_controller.dart';
import 'package:apam/models/jadwal_praktek.dart';
import 'package:apam/models/rsb_api_model.dart';
import 'package:apam/services/url.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class JadwalDokterController extends GetxController {
  final tanggal = DokterController(tgl: DateTime.now()).obs;
  final dokter = DokterController(data: List<JadwalPraktek>()).obs;
  var jadwalDokter = List<JadwalPraktek>().obs;
  var detailDokter = List<DetailDokter>().obs;
  var kdDokter = "".obs;
  var isLoading = true.obs;
  var apiList = List<DataApi>().obs;
  var selectedApi = "".obs;

  @override
  void onInit() async {
    //fetchDokter();
    super.onInit();
  }

  void fetchDokter() async {
    try {
      Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false),
      );
      http.Response response = await http.post(
        urlBase,
        body: {'action': 'dokter', 'tanggal': tanggal.value.tgl.toString()},
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = jadwalPraktekFromJson(response.body);
      if (data != null) {
        jadwalDokter.value = data;
        Get.back();
      } else {
        Get.back();
        PopUpDialog.dialogWidget('Data Kosong');
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');

      PopUpDialog.dialogWidget('Waktu Koneksi Habis');
      Get.back();
    } on SocketException catch (e) {
      print('Socket Error: $e');

      PopUpDialog.dialogWidget('Tidak Dapat Terhubung Internet');
      Get.back();
    } on Error catch (e) {
      print('General Error: $e');
      Get.back();
      // PopUpDialog.dialogWidget('Terjadi Kesalahan');
    }
  }

  Future<List<DataApi>> fetchapi() async {
    try {
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
    } on Exception catch (e) {
      Get.back();
    }
  }

  Future<List<DetailDokter>> fetchDetail() async {
    try {
      Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false),
      );
      http.Response response = await http.post(
        urlBase,
        body: {'action': 'detaildokter', 'kd_dokter': kdDokter.value},
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = detailDokterFromJson(response.body);
      detailDokter.value = data;
      Get.back();
    } on Exception catch (e) {
      Get.back();
      // PopUpDialog.dialogWidget('Tidak Dapat Terhubung dengan Server');
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
