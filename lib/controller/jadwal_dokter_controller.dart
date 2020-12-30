import 'dart:convert';

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
  var jadwalDokter = List<JadwalPraktek>().obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    fetchDokter();
    super.onInit();
  }

  // ignore: missing_return
  Future<List<JadwalPraktek>> fetchDokter() async {
    try {
      isLoading(true);
      var response = await http
          .post(urlBase + urlDokPrak,
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded"
              },
              body: {'tanggal': tanggal.value.tgl.toString()},
              encoding: Encoding.getByName("utf-8"))
          .timeout(Duration(minutes: 2));
      var dokters = jadwalPraktekFromJson(response.body);
      if (dokter != null) {
        jadwalDokter.value = dokters;
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
