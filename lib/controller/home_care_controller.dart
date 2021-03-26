import 'package:apam/models/homecarePolri_modell.dart';
import 'package:apam/models/jadwal_dokter_model.dart';
import 'package:apam/models/rsb_api_model.dart';
import 'package:apam/services/token_service.dart';
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
import 'package:apam/models/riwayat_homecare_model.dart';

class Tanggal {
  DateTime date;

  Tanggal({this.date});
}

class HomeCareController extends GetxController {
  GetStorage box = GetStorage();
  List<dynamic> poliList = List<PoliklinikList>().obs;
  var dokterList = List<JadwalDokterList>().obs;
  List<DataApi> apiList = List<DataApi>().obs;
  var succses = "".obs;
  var isSucces = false.obs;
  var kdDokter = "".obs;
  var nrp = "".obs;
  var selectedApi = "".obs;
  var isLoading = true.obs;
  final tanggal = Tanggal(date: DateTime.now()).obs;
  final kdPoli = PoliklinikList(kdPoli: "").obs;
  var homecareList = List<HomecarePolriData>().obs;
  TextEditingController poliklinik;
  TextEditingController dokter;
  TextEditingController api;
  var token = "".obs;
  var error = "".obs;

  DateTime picked;

  @override
  void onInit() {
    token.value = box.read('token');
    nrp.value = box.read('no_rkm_medis');
    poliklinik = TextEditingController();
    dokter = TextEditingController();
    api = TextEditingController();
    fetchHomecare();
    super.onInit();
  }

  // ignore: missing_return
  Future fetchPoli() async {
    // if (api.text.contains('Nganjuk')) {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));

    try {
      error.value = "";
      // var year = DateFormat('yyyy').format(tanggal.value.date);
      // var month = DateFormat('MM').format(tanggal.value.date);
      // var day = DateFormat('dd').format(tanggal.value.date);
      var date = DateTime.parse(tanggal.value.date.toString());
      http.Response response = await http.get(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/jadwalklinik/${date.year}/${date.month}/${date.day}',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );
      if (response.statusCode == 200) {
        poliList = poliklinikFromJson(response.body).data;
        Get.back();
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        Get.back();
        fetchPoli();
      } else if (response.statusCode == 404) {
        error.value = 'kosong';
        Get.back();
        PopUpDialog.dialogWidget('Data Tidak Ditemukan');
      }
    } on Exception catch (e) {
      Get.back();
      PopUpDialog.dialogWidget('Pastikan Anda Terhubung Internet');
    }
    // } else {
    //   error.value = 'noavailable';
    // }
  }

  // ignore: missing_return
  Future<List<JadwalDokter>> fetchDokter() async {
    // if (api.text.contains('Nganjuk')) {
    error.value = "";
    try {
      Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false),
      );
      var date = DateTime.parse(tanggal.value.date.toString());
      var response = await http.get(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/jadwaldokter/${date.year}/${date.month}/${date.day}/U000',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );

      if (response.statusCode == 200) {
        var data = jadwalDokterFromJson(response.body).data;
        dokterList.value = data;
        Get.back();
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        Get.back();
        await fetchDokter();
      } else if (response.statusCode == 404) {
        error.value = 'kosong';
        Get.back();
        PopUpDialog.dialogWidget('Dokter Tidak Ditemukan Pilih Tanggal Lain');
      }
    } on Exception catch (e) {
      Get.back();
      PopUpDialog.dialogWidget('Pastikan Anda Terhubung Internet');
    }
    // } else {
    //   error.value = 'noavailable';
    // }
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

  Future postPendaftaran() async {
    // if (api.text.contains('Nganjuk')) {
    if (dokter.text == "") {
      PopUpDialog.dialogAnimation('Data Masih Ada Yang Kosong !');
    } else {
      try {
        succses.value = "";
        //  isSucces(false);
        PopUpDialog.dialogCircular();

        var response = await http
            .post(
              'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/homevisit',
              body: {
                'nrp': nrp.value.toString(),
                'poli': 'U000',
                'dokter': kdDokter.value.toString(),
                'tgl': DateFormat('yyyy-MM-dd')
                    .format(tanggal.value.date)
                    .toString(),
              },
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded",
                "Authorization": "Bearer " + token.value
              },
              encoding: Encoding.getByName("utf-8"),
            )
            .timeout(Duration(minutes: 2));

        var data = jsonDecode(response.body);
        print(data);
        if (response.statusCode == 200) {
          print('berhasil');
          Get.back();
          succses.value = 'Sukses';
        } else if (response.statusCode == 404) {
          var data = jsonDecode(response.body);
          if (data["message"] == "Duplication") {
            Get.back();
            succses.value = 'Duplicate';
          } else if (data["message"] == "Full") {
            Get.back();
            succses.value = 'Full';
          }
        } else if (response.statusCode == 401) {
          token.value = await TokenServices(
                  'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                  'yudo',
                  'qwerty123')
              .getToken();
          await box.write('token', token.value);
          Get.back();
          await postPendaftaran();
        } else {
          Get.back();
          succses.value = 'Fail';
        }
      } on Exception catch (e) {
        Get.back();
        succses.value = e.toString();
      }
    }
    // } else {
    //   succses.value = 'notavailable';
    // }
  }

  Future<List<RiwayatHomeCare>> fetchHomecare() async {
    try {
      isLoading(true);
      var response = await http.get(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/homevisit/${nrp.value}',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );
      if (response.statusCode == 200) {
        var data = homecarePolriFromJson(response.body).data;
        homecareList.value = data;
        isLoading(false);
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        fetchHomecare();
      } else if (response.statusCode == 404) {
        isLoading(false);
        // PopUpDialog.dialogWidget('Data Kosong');
      }
    } on Exception catch (e) {
      print(e);
      isLoading(false);
    }
  }

  void clearInput() {
    api.text = "";
    poliklinik.text = "";
    dokter.text = "";
  }

  @override
  void onClose() {
    poliklinik?.dispose();
    dokter?.dispose();
    api?.dispose();
    super.onClose();
  }
}
