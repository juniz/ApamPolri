import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

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

  static dialogKonfirmasiPendaftaran(
      DateTime tgl, String rmh, String poli, String dokter, void ok) {
    Get.dialog(
      AlertDialog(
        title: Text('Konfirmasi Pendaftaran'),
        content: Column(
          children: <Widget>[
            Text('Tanggal      :  ${DateFormat('dd-MM-yyyy').format(tgl)}'),
            Text('Rumah Sakit  :  $rmh'),
            Text('Poliklinik   :  $poli'),
            Text('dokter       :  $dokter'),
          ],
        ),
        elevation: 20.0,
        actions: [
          FlatButton(
            color: Colors.green,
            onPressed: () {
              ok;
            },
            child: Text('Ok'),
          ),
          FlatButton(
            color: Colors.redAccent,
            onPressed: () {
              Get.back();
            },
            child: Text('Close'),
          )
        ],
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

  static dialogCircular() {
    Get.dialog(
      AlertDialog(
        content: SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        elevation: 20.0,
      ),
      barrierDismissible: false,
    );
  }
}
