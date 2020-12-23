import 'dart:convert';
import 'dart:ui';
import 'package:apam/models/jadwal_dokter_model.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/poloklinik_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:get/get.dart';
import 'package:apam/services/request.dart';
import 'package:apam/services/url.dart';

class Tanggal {
  DateTime date;

  Tanggal({this.date});
}

class HomeVisiteController extends GetxController {
  List<dynamic> poliList = List<Poliklinik>().obs;
  List<JadwalDokter> dokterList = List<JadwalDokter>().obs;
  final tanggal = Tanggal(date: DateTime.now()).obs;
  final kdPoli = Poliklinik(kdPoli: "").obs;
  TextEditingController poliklinik;
  TextEditingController dokter;

  DateTime picked;

  @override
  void onInit() {
    poliklinik = TextEditingController();
    dokter = TextEditingController();
    super.onInit();
  }

  // ignore: missing_return
  Future<List<Poliklinik>> fetchPoli() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var response = await http.post(
      urlBase + urlPoli,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      //body: {'tanggal': tanggal.value.toString()},
    ).timeout(Duration(minutes: 2));
    poliList = poliklinikFromJson(response.body);
    Get.back();
  }

  // ignore: missing_return
  Future<List<JadwalDokter>> fetchDokter() async {
    Future.delayed(
      Duration.zero,
      () => Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false),
    );
    var response = await http.post(
      urlBase + urlDok,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
        'tanggal': tanggal.value.toString(),
        'kd_poli': kdPoli.value.kdPoli.toString()
      },
    ).timeout(Duration(minutes: 2));
    dokterList = jadwalDokterFromJson(response.body);
    Get.back();
  }

  void clearInput() {
    poliklinik.text = "";
    dokter.text = "";
  }

  @override
  void onClose() {
    poliklinik?.dispose();
    dokter?.dispose();
    super.onClose();
  }
}
