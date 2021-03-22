import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apam/services/preference.dart';
import 'package:apam/services/token_service.dart';
import 'package:apam/services/url.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/profile_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:apam/models/profile_firebase_model.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var profil = DataProfile().obs;
  var isLoading = true.obs;
  var rkm = "".obs;
  var uid = "".obs;
  var url = "".obs;
  var token = "".obs;
  var photoURL = "".obs;
  var isGoogle = false.obs;
  var doc = ProfilFirebase().obs;
  final box = GetStorage();

  @override
  void onInit() async {
    rkm.value = box.read('no_rkm_medis');
    token.value = box.read('token');
    url.value = box.read('url');
    uid.value = box.read('uid');
    isGoogle.value = box.read('isGoogle');
    photoURL.value = box.read('photoURL');
    // fireProfile();
    await fetchProfile();
    // cek();
    super.onInit();
  }

  void cek() {
    if (isGoogle.value == true) {
      fireProfile();
    } else {
      fetchProfile();
    }
  }

  Future fireProfile() async {
    try {
      isLoading(true);
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid.value)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          doc.value = ProfilFirebase.fromDocumentSnapshot(documentSnapshot);
          isLoading(false);
        }
      });
    } on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ignore: missing_return
  Future fetchProfile() async {
    try {
      isLoading(true);
      http.Response response = await http.get(
        url.value + 'polri/' + rkm.value,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": "Bearer " + token.value
        },
      );

      if (response.statusCode == 200) {
        var data = profileFromJson(response.body).data;
        profil.value = data;
      } else if (response.statusCode == 401) {
        token.value = await TokenServices(
                'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/token',
                'yudo',
                'qwerty123')
            .getToken();
        await box.write('token', token.value);
        fetchProfile();
      } else {
        isLoading(false);
        PopUpDialog.dialogWidget('Data Kosong');
      }
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
      isLoading(false);
      PopUpDialog.dialogWidget('Waktu Koneksi Habis');
    } on SocketException catch (e) {
      print('Socket Error: $e');
      isLoading(false);
      PopUpDialog.dialogWidget('Tidak Dapat Terhubung Internet');
    } on Error catch (e) {
      print('General Error: $e');
      isLoading(false);
      PopUpDialog.dialogWidget('Terjadi Kesalahan');
    } finally {
      isLoading(false);
    }
  }

  Future logout() async {
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    await LocalData.delPref('no_rkm_medis');
    await LocalData.delPref('token');
    await LocalData.delPref('isGoogle');
    await LocalData.delPref('uid');
    await LocalData.delPref('photoURL');
    await signOut();
    Future.delayed(Duration(seconds: 0), () {
      Get.back();
      Get.offAllNamed("/login");
    });
  }

  Future signOut() async {
    await googleSignIn.signOut();
  }
}
