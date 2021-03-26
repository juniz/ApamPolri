import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apam/services/token_service.dart';
import 'package:get/get.dart';
import 'package:apam/models/kamar_model.dart';
import 'package:apam/models/rsb_api_model.dart';
import 'package:apam/services/url.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class KamarController extends GetxController {
  GetStorage box = GetStorage();
  var kamarList = List<KamarList>().obs;
  var isLoading = true.obs;
  var apiList = List<DataApi>().obs;
  var selectedApi = "".obs;
  var hasil = "".obs;
  var token = "".obs;

  var username = "".obs;
  var password = "".obs;

  @override
  void onInit() {
    //fetchKamar();
    token.value = box.read('token');
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

  Future fetchKamar() async {
    // if (selectedApi.value.contains('Nganjuk')) {
    hasil.value = 'available';
    try {
      isLoading(true);
      http.Response response = await http.get(
        selectedApi.value + 'kamar',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );

      if (response.statusCode == 200) {
        var data = kamarFromJson(response.body).data;
        kamarList.value = data;
      } else if (response.statusCode == 404) {
        hasil.value = '404';
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                selectedApi.value + 'token', username.value, password.value)
            .getToken();
        await box.write('token', token.value);
        fetchKamar();
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
    // } else {
    //   hasil.value = 'notavailable';
    // }
  }
}
