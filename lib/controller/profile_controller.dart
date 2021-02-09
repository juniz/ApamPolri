import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apam/services/preference.dart';
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
  var profil = Profile().obs;
  var isLoading = true.obs;
  var rkm = "".obs;
  var uid = "".obs;
  var photoURL = "".obs;
  var isGoogle = false.obs;
  var doc = ProfilFirebase().obs;
  final box = GetStorage();

  @override
  void onInit() {
    rkm.value = box.read('no_rkm_medis');
    uid.value = box.read('uid');
    isGoogle.value = box.read('isGoogle');
    photoURL.value = box.read('photoURL');
    // fireProfile();
    // fetchProfile();
    cek();
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
  void fetchProfile() async {
    try {
      isLoading(true);
      http.Response response = await http.post(
        urlBase,
        body: {'action': 'profil', 'no_rkm_medis': rkm.value},
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        encoding: Encoding.getByName("utf-8"),
      );
      var data = profileFromJson(response.body);
      if (data != null) {
        profil.value = data;
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
    Future.delayed(Duration(seconds: 5), () {
      Get.back();
      Get.offAllNamed("/login");
    });
  }

  Future signOut() async {
    await googleSignIn.signOut();
  }
}
