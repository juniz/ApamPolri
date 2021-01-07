import 'package:apam/models/jadwal_dokter_model.dart';
import 'package:apam/models/rsb_api_model.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/poloklinik_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/services/url.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class Tanggal {
  DateTime date;

  Tanggal({this.date});
}

class PendaftaranController extends GetxController {
  List<dynamic> poliList = List<Poliklinik>().obs;
  List<JadwalDokter> dokterList = List<JadwalDokter>().obs;
  List<DataApi> apiList = List<DataApi>().obs;

  var kdDokter = "".obs;
  var nrp = "".obs;
  var selectedApi = "".obs;
  var isLoading = true.obs;
  final tanggal = Tanggal(date: DateTime.now()).obs;
  final kdPoli = Poliklinik(kdPoli: "").obs;
  TextEditingController poliklinik;
  TextEditingController dokter;
  TextEditingController api;

  DateTime picked;

  @override
  void onInit() {
    GetStorage box = GetStorage();
    nrp.value = box.read('no_rkm_medis');
    poliklinik = TextEditingController();
    dokter = TextEditingController();
    api = TextEditingController();
    super.onInit();
  }

  // ignore: missing_return
  Future<List<Poliklinik>> fetchPoli() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    var response = await http.post(
      selectedApi + urlPoli,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: {
        'tanggal':
            DateFormat('dd-MM-yyyy').format(tanggal.value.date).toString()
      },
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
        'tanggal':
            DateFormat('dd-MM-yyyy').format(tanggal.value.date).toString(),
        'kd_poli': kdPoli.value.kdPoli
      },
    ).timeout(Duration(minutes: 2));
    dokterList = jadwalDokterFromJson(response.body);
    Get.back();
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
    apiList = rsbApiFromJson(response.body).data;
    Get.back();
  }

  void postPendaftaran() async {
    if (api.text == "" && dokter.text == "" && poliklinik.text == "") {
      PopUpDialog.dialogAnimation('Data Masih Ada Yang Kosong !');
    } else {
      Get.dialog(
          AlertDialog(
            //title: Text('Mohon Tunggu Sebentar'),
            content: SizedBox(
              width: 100,
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            elevation: 20.0,
          ),
          barrierDismissible: false);
      var response = await http
          .post(
            "http://10.0.2.2/api-rsbnganjuk/public/index.php/pendaftaran",
            body: {
              'nrp': nrp.value.toString(),
              'poli': kdPoli.value.kdPoli.toString(),
              'dokter': kdDokter.value.toString(),
              'tgl': tanggal.value.date.toString()
            },
            headers: {
              'Connection': 'Keep-alive',
              'Keep-alive': 'timeout=5, max=100',
              "Accept": "application/json",
            },
            encoding: Encoding.getByName("utf-8"),
          )
          .timeout(Duration(minutes: 2));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('berhasil');
        Get.back();
        Get.dialog(
          AlertDialog(
            title: Text('Data Berhasil Disimpan'),
            content: SizedBox(
              width: 150,
              height: 150,
              child: Center(
                child: LottieBuilder.asset('assets/animation/plane.json'),
              ),
            ),
            elevation: 20.0,
          ),
          barrierDismissible: false,
        );
        Future.delayed(Duration(seconds: 2), () {
          Get.back();
          Get.toNamed('/dashboard');
        });
      } else {
        Get.back();
        PopUpDialog.dialogAnimation('Data Gagal Disimpan');
      }
    }
  }

  void clearInput() {
    poliklinik.text = "";
    dokter.text = "";
    api.text = "";
  }

  @override
  void onClose() {
    poliklinik?.dispose();
    dokter?.dispose();
    api?.dispose();
    super.onClose();
  }
}