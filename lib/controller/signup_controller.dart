import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:apam/services/preference.dart';
import 'package:apam/services/token_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:otp/otp.dart';

class SignUpController extends GetxController {
  TextEditingController nrpController;
  TextEditingController ktpController;
  TextEditingController namaController;
  TextEditingController satuanController;
  TextEditingController emailController;
  TextEditingController hpController;
  TextEditingController jkController;
  TextEditingController alamatController;
  TextEditingController rumkitController;
  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var nama = "".obs;
  var email = "".obs;
  var token = "".obs;
  var hasil = "".obs;
  var res = "".obs;
  var param = Map<String, dynamic>().obs;
  var otp = "".obs;
  var tgl = DateTime.now().obs;

  List<JK> listJK = [JK('P', 'Perempuan'), JK('L', "Laki-Laki")];
  var selectedJK = "".obs;

  @override
  void onInit() async {
    nrpController = TextEditingController();
    ktpController = TextEditingController();
    namaController = TextEditingController();
    satuanController = TextEditingController();
    emailController = TextEditingController();
    jkController = TextEditingController();
    hpController = TextEditingController();
    alamatController = TextEditingController();
    rumkitController = TextEditingController();
    // token.value = await box.read('token');
    // otp = OTP.generateHOTPCodeString("BHAYANGKARA", 5);
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

  Future saveParam() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    param.value = {
      'nrp': nrpController.text,
      'ktp': ktpController.text,
      'nama': namaController.text.toUpperCase(),
      'jk': selectedJK.value,
      'email': emailController.text,
      'telp': hpController.text,
      'satuan': satuanController.text.toUpperCase(),
      'tgl_lahir': DateFormat('yyyy-MM-dd').format(tgl.value),
      'alamat': alamatController.text.toUpperCase()
    };
    print(param.value);
    Get.back();
  }

  Future getOTP() async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      res.value = "";
      print(param.value["email"]);
      token.value = await TokenServices(
              'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
              'yudo',
              'qwerty123')
          .getToken();
      box.write('token', token);
      var response = await http.post(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/polri/otp',
        body: {'email': param.value["email"]},
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = jsonDecode(response.body);
      print(data);
      print(data["data"]['otp']);
      if (response.statusCode == 200) {
        hasil.value = '200';
        otp.value = data["data"]['otp'].toString();
        Get.back();
      } else if (response.statusCode == 404) {
        hasil.value = '404';
        res.value = data["message"];
        Get.back();
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);

        await postData();
      } else {
        hasil.value = 'fail';
        res.value = "Gagal Menyimpan Data";
        Get.back();
      }
    } catch (e) {
      print(e.toString());
      hasil.value = e.toString();
      res.value = e.toString();
      Get.back();
    }
  }

  Future postData() async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      res.value = "";

      token.value = await TokenServices(
              'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
              'yudo',
              'qwerty123')
          .getToken();
      box.write('token', token);
      var response = await http.post(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/polri',
        body: param.value,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = jsonDecode(response.body);
      // print(data["data"]['nrp']);
      if (response.statusCode == 200) {
        hasil.value = '200';
        LocalData.savePref('no_rkm_medis', data["data"]['nrp']);
      } else if (response.statusCode == 404) {
        hasil.value = '404';
        res.value = data["message"];
        Get.back();
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        Get.back();
        await postData();
      } else {
        hasil.value = 'fail';
        res.value = "Gagal Menyimpan Data";
        Get.back();
      }
    } catch (e) {
      print(e.toString());
      hasil.value = e.toString();
      res.value = e.toString();
      Get.back();
    }
  }

  // void clear() {
  //   nrpController.text = '';
  //   ktpController.text = '';
  //   namaController.text = '';
  //   satuanController.text = '';
  //   emailController.text = '';
  // }
}

class JK {
  final String id;
  final String text;

  JK(this.id, this.text);
}
