import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/utility/router.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.init(
    "370f8fff-4006-4095-94c2-82bd0b4bf255",
    iOSSettings: null,
  );
  OneSignal.shared
      .setInFocusDisplayType(OSNotificationDisplayType.notification);

  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AKPOL',
      //home:SplashScreenPage(),
      getPages: RouterPage.route,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        fontFamily: 'roboto',
        //backgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.white,
        fontFamily: 'roboto',
      ),
      locale: Locale('id'),
      initialRoute: '/',
    ),
  );
}
