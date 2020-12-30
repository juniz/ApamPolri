import 'package:apam/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/utility/router.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen',
      //home:SplashScreenPage(),
      getPages: RouterPage.route,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      initialRoute: '/',
    ),
  );
}
