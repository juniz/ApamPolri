import 'dart:convert';
import 'package:apam/models/daftar_klinik.dart';
import 'package:apam/models/detail_klinik.dart';
import 'package:apam/models/token_model.dart';
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
import 'package:apam/services/token_service.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.put(DashboardController());
  var selectedTabIndex = 0.obs;
  GetStorage box = GetStorage();
  var error = "".obs;
  var token = "".obs;
  var rkm = "".obs;
  var username = "".obs;
  var password = "".obs;
  var url = "".obs;
  var urlBlog = "".obs;
  var telp = "".obs;
  var listPage = <dynamic>[MenuPage(), ProfilePage()];
  Widget get currentPage => listPage[selectedTabIndex.value];
  var bookList = List<Booking>().obs;
  var klinikList = List<DataKlinikList>().obs;
  var detailKlinik = List<DetailKlinikList>().obs;
  var isLoading = true.obs;
  var kdPoli = "".obs;
  var nmPoli = "".obs;
  var rumkit = "".obs;

  @override
  void onInit() {
    rkm.value = box.read('no_rkm_medis');
    // token.value = box.read('token');
    username.value = box.read('username');
    password.value = box.read('password');
    url.value = box.read('url');
    urlBlog.value = box.read('urlBlog');
    telp.value = box.read('telp');
    //fetchBooking();
    fetchKlinik();
    super.onInit();
  }

  navBarTapped(int index) {
    selectedTabIndex.value = index;
  }

  // Future<List<Booking>> fetchBooking() async {
  //   try {
  //     isLoading(true);
  //     var response = await http.post(urlBase,
  //         headers: {
  //           "Accept": "application/json",
  //           "Content-Type": "application/x-www-form-urlencoded"
  //         },
  //         body: {'action': 'booking', 'no_rkm_medis': rkm.value},
  //         encoding: Encoding.getByName("utf-8"));
  //     var data = bookingFromJson(response.body);
  //     if (data != null) {
  //       bookList.value = data;
  //       isLoading(false);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<List<DaftarKlinik>> fetchKlinik() async {
    try {
      isLoading(true);
      var response = await http.get(
        '${url.value}poliklinik',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );

      if (response.statusCode == 200) {
        var data = daftarKlinikFromJson(response.body).data;
        klinikList.value = data;
        isLoading(false);
      } else if (response.statusCode == 404) {
        error.value = '404';
        isLoading(false);
      } else if (response.statusCode == 401) {
        error.value = '401';
        token.value =
            await TokenServices('${url.value}token', 'yudo', 'qwerty123')
                .getToken();
        await box.write('token', token.value);
        fetchKlinik();

        // Get.offAllNamed('/login');
      }
    } on Exception catch (e) {
      error.value = 'noconnection';
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
      http.Response response = await http.get(
        '${url.value}poliklinik/' + kdPoli.toString(),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );
      if (response.statusCode == 200) {
        var data = detailKlinikFromJson(response.body).data;
        detailKlinik.value = data;
        Get.back();
      } else if (response.statusCode == 404) {
        error.value = '404';
        Get.back();
      } else if (response.statusCode == 401) {
        token.value =
            await TokenServices('${url.value}token', 'yudo', 'qwerty123')
                .getToken();
        await box.write('token', token.value);
        fetchJadwal();
      }
    } on Exception catch (e) {
      Get.back();
      // PopUpDialog.dialogWidget('Tidak Dapat Terhubung dengan Server');
    }
  }
}
