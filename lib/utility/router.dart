import 'package:apam/dashboard.dart';
import 'package:apam/home_view.dart';
import 'package:apam/home_visit.dart';
import 'package:apam/jadwal_dokter_page.dart';
import 'package:apam/login.dart';
import 'package:apam/panduan.dart';
import 'package:apam/splashscreen_view.dart';
import 'package:get/get.dart';

class RouterPage {
  static final route = [
    GetPage(
      name: '/',
      page: () => SplashScreenPage(),
    ),
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
      name: '/homevisite',
      page: () => HomeVisitePage(),
    ),
    GetPage(
      name: '/jadwalDokter',
      page: () => JadwalDokterPage(),
    ),
  ];
}
