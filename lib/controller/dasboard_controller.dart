import 'package:apam/menu_page.dart';
import 'package:apam/profile_page.dart';
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

  @override
  void onInit() {
    rkm.value = box.read('no_rkm_medis');
    super.onInit();
  }

  navBarTapped(int index) {
    selectedTabIndex.value = index;
  }
}
