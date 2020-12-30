import 'package:flutter/material.dart';
import 'dart:async';
import 'package:apam/home_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.offAllNamed("/login");
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (_) {
      //     return HomePage();
      //   }),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: Get.width,
          height: Get.height / 2,
          child: LottieBuilder.asset("assets/animation/hospital.json"),
        ),
      ),
    );
  }
}
