import 'package:apam/services/preference.dart';
import 'package:apam/services/token_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController nrpController;
  TextEditingController ktpController;
  TextEditingController namaController;
  TextEditingController satuanController;
  TextEditingController emailController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var nama = "".obs;
  var email = "".obs;

  @override
  void onInit() {
    nrpController = TextEditingController();
    ktpController = TextEditingController();
    namaController = TextEditingController();
    satuanController = TextEditingController();
    emailController = TextEditingController();

    super.onInit();
  }

  Future insert(User uid) async {
    DocumentReference users = firestore.collection('users').doc(uid.uid);

    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      var token = await TokenServices(
              'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
              'yudo',
              'qwerty123')
          .getToken();
      users.set({
        'nrp': nrpController.text,
        'ktp': ktpController.text,
        'nama': namaController.text,
        'satuan': satuanController.text,
        'email': emailController.text,
        'idEmail': uid.uid,
        'docId': uid.uid
      });
      LocalData.savePref('no_rkm_medis', nrpController.text);
      LocalData.savePref('token', token.toString());
      LocalData.savePref('isGoogle', true);
      LocalData.savePref('uid', uid.uid);
      LocalData.savePref('photoURL', uid.photoURL);
      Get.back();
      Get.offAllNamed('/dashboard');
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void clear() {
    nrpController.text = '';
    ktpController.text = '';
    namaController.text = '';
    satuanController.text = '';
    emailController.text = '';
  }
}
