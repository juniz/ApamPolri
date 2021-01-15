import 'package:apam/dashboard.dart';
import 'package:apam/detail_klinik_page.dart';
import 'package:apam/home_care_page.dart';
import 'package:apam/home_view.dart';
import 'package:apam/pendaftaran_page.dart';
import 'package:apam/jadwal_dokter_page.dart';
import 'package:apam/kamar_page.dart';
import 'package:apam/login.dart';
import 'package:apam/panduan.dart';
import 'package:apam/riwayat_page.dart';
import 'package:apam/splashscreen_view.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RouterPage {
  static final route = [
    GetPage(
        name: '/',
        page: () {
          GetStorage box = GetStorage();
          return box.hasData('no_rkm_medis')
              ? DashboardPage()
              : SplashScreenPage();
        }),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
    ),
    GetPage(
      name: '/panduan',
      page: () => PanduanPage(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/dashboard',
      page: () => DashboardPage(),
    ),
    GetPage(
      name: '/pendaftaran',
      page: () => PendaftaranPage(),
    ),
    GetPage(
      name: '/jadwalDokter',
      page: () => JadwalDokterPage(),
    ),
    GetPage(
      name: '/kamar',
      page: () => KamarPage(),
    ),
    GetPage(
      name: '/homecare',
      page: () => HomeCarePage(),
    ),
    GetPage(
      name: '/riwayat',
      page: () => RiwayatPage(),
    ),
    GetPage(
      name: '/detailklinik',
      page: () => DetailKlinik(),
    ),
  ];
}
