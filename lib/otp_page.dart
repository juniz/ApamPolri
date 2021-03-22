import 'package:apam/services/preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_screen/otp_screen.dart';

import 'controller/signup_controller.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final SignUpController signupController = Get.put(SignUpController());
  var polri = Get.arguments;

  Future<String> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));

    if (otp == signupController.otp.value) {
      await signupController.postData();
      if (signupController.hasil.value == '200') {
        Get.offAllNamed('/dashboard');
      }
      return null;
    } else {
      return "Kode Verifikasi Salah";
    }
  }

  void moveToNextScreen(context) {
    Get.offAllNamed('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return OtpScreen(
      otpLength: 4,
      validateOtp: validateOtp,
      routeCallback: moveToNextScreen,
      titleColor: Colors.black,
      themeColor: Colors.black,
    );
  }
}
