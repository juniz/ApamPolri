import 'package:apam/models/jadwal_dokter_controller.dart';
import 'package:apam/models/jadwal_praktek.dart';
import 'package:apam/services/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class JadwalDokterController extends GetxController {
  final tanggal = DokterController(tgl: DateTime.now()).obs;
  final dokter = DokterController(data: List<JadwalPraktek>()).obs;

  @override
  void onInit() {
    fetchDokter();
    super.onInit();
  }

  // ignore: missing_return
  Future<List<JadwalPraktek>> fetchDokter() async {
    var formatDate = DateFormat('yyyy-MM-dd').format(tanggal.value.tgl);
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var response = await http.post(
      urlBase + urlDokPrak,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      //body: {'tanggal': tanggal.value.toString()},
    ).timeout(Duration(minutes: 2));
    dokter.value.data = jadwalPraktekFromJson(response.body);
    Get.back();
  }
}
