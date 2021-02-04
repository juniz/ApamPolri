import 'package:flutter/material.dart';
import 'package:apam/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.offAllNamed('/login');
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
        'assets/images/first.jpg',
        'Informasi Pelayanan Kesehatan Rumah Sakit Bhayangkara',
        'Anggota POLRI Lebih Mudah Berobat Ke Rumah Sakit Bhayangkara Terdekat.'),
    OnboardingInfo(
        'assets/images/415.jpg',
        'Home Visiting dan Layanan Antar Jemput Ke Rumah',
        'Tidak Perlu Repot Data Ke Rumah Sakit, Cukup Dengan Aplikasi Dokter Kami Akan Mengunjungi Anda.'),
    OnboardingInfo('assets/images/data.jpg', 'Riwayat Medis',
        'Mudah dan Cepat Mendapatkan Informasi Riwayat Medis.')
  ];
}
