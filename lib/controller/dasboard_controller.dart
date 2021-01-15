import 'dart:convert';
import 'package:apam/models/daftar_klinik.dart';
import 'package:apam/models/detail_klinik.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:apam/menu_page.dart';
import 'package:apam/models/booking_model.dart';
import 'package:apam/profile_page.dart';
import 'package:apam/services/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:apam/widget/modal_daftar.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  var selectedTabIndex = 0.obs;
  GetStorage box = GetStorage();
  var rkm = "".obs;
  var listPage = <dynamic>[MenuPage(), ProfilePage()];
  Widget get currentPage => listPage[selectedTabIndex.value];
  var bookList = List<Booking>().obs;
  var klinikList = List<DaftarKlinik>().obs;
  var detailKlinik = List<DetailKlinik>().obs;
  var isLoading = true.obs;
  var kdPoli = "".obs;

  @override
  void onInit() {
    rkm.value = box.read('no_rkm_medis');
    //fetchBooking();
    fetchKlinik();
    super.onInit();
  }

  navBarTapped(int index) {
    selectedTabIndex.value = index;
  }

  Future<List<Booking>> fetchBooking() async {
    try {
      isLoading(true);
      var response = await http.post(urlBase,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: {'action': 'lastbooking', 'no_rkm_medis': rkm.value},
          encoding: Encoding.getByName("utf-8"));
      var data = bookingFromJson(response.body);
      if (data != null) {
        bookList.value = data;
      }
    } finally {
      isLoading(false);
      return bookList;
    }
  }

  Future<List<DaftarKlinik>> fetchKlinik() async {
    try {
      isLoading(true);
      var response = await http.post(urlBase,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          },
          body: {'action': 'daftarklinik'},
          encoding: Encoding.getByName("utf-8"));
      var data = daftarKlinikFromJson(response.body);
      if (data != null) {
        klinikList.value = data;
        isLoading(false);
      }
    } on Exception catch (e) {
      isLoading(false);
      print(e);
      //PopUpDialog.dialogWidget('Gagal Terhubung Dengan Server');
    }
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
        body: {'action': 'detailklinik', 'kd_poli': kdPoli.value},
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
