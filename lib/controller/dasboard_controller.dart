import 'dart:convert';
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
  var isLoading = true.obs;

  @override
  void onInit() {
    rkm.value = box.read('no_rkm_medis');
    fetchBooking();
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
    }
  }
}
