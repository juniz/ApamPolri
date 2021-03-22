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
import 'package:apam/models/booking_model.dart';

class Tanggal {
  DateTime date;

  Tanggal({this.date});
}

class PendaftaranController extends GetxController {
  GetStorage box = GetStorage();
  var poliList = List<PoliklinikList>().obs;
  List<JadwalDokterList> dokterList = List<JadwalDokterList>().obs;
  List<DataApi> apiList = List<DataApi>().obs;
  var hasil = "".obs;
  var kdDokter = "".obs;
  var nrp = "".obs;
  var selectedApi = "".obs;
  var isLoading = true.obs;
  final tanggal = Tanggal(date: DateTime.now()).obs;
  final kdPoli = PoliklinikList(kdPoli: "").obs;
  var bookList = List<BookingList>().obs;
  TextEditingController poliklinik;
  TextEditingController dokter;
  TextEditingController api;
  var token = "".obs;

  DateTime picked;

  @override
  void onInit() {
    token.value = box.read('token');
    nrp.value = box.read('no_rkm_medis');
    poliklinik = TextEditingController();
    dokter = TextEditingController();
    api = TextEditingController();
    fetchBooking();
    super.onInit();
  }

  // ignore: missing_return
  Future fetchPoli() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    try {
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
        poliList.value = poliklinikFromJson(response.body).data;
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
        Get.back();
        PopUpDialog.dialogWidget(
            'Data Dokter Tidak Ditemukan Pilih Tanggal Lainnya');
      }
    } on Exception catch (e) {
      Get.back();
      PopUpDialog.dialogWidget('Pastikan Anda Terhubung Internet');
    }
  }

  // ignore: missing_return
  Future<List<JadwalDokter>> fetchDokter() async {
    try {
      Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false),
      );
      var year = DateFormat('yyyy').format(tanggal.value.date);
      var month = DateFormat('MM').format(tanggal.value.date);
      var day = DateFormat('dd').format(tanggal.value.date);
      var date = DateTime.parse(tanggal.value.date.toString());
      var response = await http.get(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/jadwaldokter/${year}/${month}/${day}/${kdPoli.value.kdPoli}',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );
      if (response.statusCode == 200) {
        dokterList = jadwalDokterFromJson(response.body).data;
        Get.back();
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        Get.back();
        fetchDokter();
      } else if (response.statusCode == 404) {
        Get.back();
        PopUpDialog.dialogWidget('Data Dokter Tidak Ditemukan');
      }
    } on Exception catch (e) {
      Get.back();
      PopUpDialog.dialogWidget('Pastikan Anda Terhubung Internet');
    }
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

  void konfirmasi() async {
    if (api.text == "" || dokter.text == "" || poliklinik.text == "") {
      PopUpDialog.dialogAnimation('Data Masih Ada Yang Kosong !');
    } else {
      await PopUpDialog.dialogKonfirmasiPendaftaran(tanggal.value.date,
          api.text, poliklinik.text, dokter.text, postPendaftaran());
    }
  }

  Future postPendaftaran() async {
    if (api.text.contains('Nganjuk')) {
      if (api.text == "" || dokter.text == "" || poliklinik.text == "") {
        PopUpDialog.dialogAnimation('Data Masih Ada Yang Kosong !');
      } else {
        try {
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
          var response = await http.post(
            'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/booking',
            body: {
              'no_rkm_medis': nrp.value,
              'kd_poli': kdPoli.value.kdPoli,
              'kd_dokter': kdDokter.value,
              'tanggal': DateFormat('yyyy-MM-dd')
                  .format(tanggal.value.date)
                  .toString(),
              'kd_pj': 'A01'
            },
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/x-www-form-urlencoded",
              "Authorization": "Bearer " + token.value
            },
            encoding: Encoding.getByName("utf-8"),
          );
          var data = jsonDecode(response.body);
          print(response.body);
          print(response.statusCode);
          print(nrp);
          if (response.statusCode == 200) {
            hasil.value = 'success';
            Get.back();
          } else if (response.statusCode == 404) {
            if (data["message"] == 'Limit') {
              hasil.value = 'limit';
              Get.back();
            } else {
              hasil.value = 'duplicate';
              Get.back();
            }
          } else if (response.statusCode == 401) {
            token.value = await TokenServices(
                    'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                    'yudo',
                    'qwerty123')
                .getToken();
            await box.write('token', token.value);
            Get.back();
            postPendaftaran();
          } else {
            Get.back();
            hasil.value = 'fail';
          }
        } on Exception catch (e) {
          hasil.value = 'noconnection';
          Get.back();
        }
      }
    } else {
      hasil.value = 'noavailable';
    }
  }

  Future<List<Booking>> fetchBooking() async {
    try {
      isLoading(true);
      var response = await http.get(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/booking/${nrp.value}',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );

      if (response.statusCode == 200) {
        var data = bookingFromJson(response.body).data;
        bookList.value = data;
        isLoading(false);
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        fetchBooking();
      } else if (response.statusCode == 404) {
        isLoading(false);
        // PopUpDialog.dialogWidget('Pastikan Anda Terhubung Internet');
      }
    } on Exception catch (e) {
      print(e);
      isLoading(false);
      PopUpDialog.dialogWidget('Tidak Dapat Terhubung Dengan Jaringan');
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
