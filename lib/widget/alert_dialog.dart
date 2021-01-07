import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PopUpDialog {
  static dialogWidget(String dialog) {
    Get.dialog(
      AlertDialog(
        title: Text('Error'),
        content: Text(dialog),
        elevation: 20.0,
      ),
      barrierDismissible: true,
    );
  }

  static dialogAnimation(String dialog) {
    Get.dialog(
      AlertDialog(
        title: Text(dialog),
        content: SizedBox(
          width: 100,
          height: 100,
          child: LottieBuilder.asset("assets/animation/warning-sign.json"),
        ),
        actions: [
          FlatButton(
            color: Colors.redAccent,
            onPressed: () {
              Get.back();
            },
            child: Text('Close'),
          )
        ],
        elevation: 20.0,
      ),
    );
  }
}
