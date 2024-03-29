import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apam/models/rumkit_model.dart';
import 'package:apam/services/preference.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/services/request.dart';
import 'package:apam/services/url.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/token_model.dart';
import 'package:apam/models/login_model.dart';
import 'package:apam/services/token_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class LoginController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  TextEditingController rumkitController;
  List<DataRumkit> rumkit = List<DataRumkit>().obs;
  var api = "".obs;
  var username = "".obs;
  var password = "".obs;
  var rumkitApi = "".obs;

  var hasil = "".obs;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    rumkitController = TextEditingController();
    // await apiRumkit();
    super.onInit();
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return user;
    }

    return null;
  }

  void cek() async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
      username.value = await LocalData.getPref('username');
      password.value = await LocalData.getPref('password');
      api.value = await LocalData.getPref('url');
      var token = await TokenServices(
              '${api.value}token', username.value, password.value)
          .getToken();
      var uid = await signInWithGoogle();
      FirebaseFirestore.instance
          .collection('users')
          .doc(uid.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          // print('Document data: ${documentSnapshot.data()}');
          LocalData.savePref('no_rkm_medis', documentSnapshot.data()['nrp']);
          LocalData.savePref('token', token.toString());
          LocalData.savePref('isGoogle', true);
          LocalData.savePref('uid', uid.uid);
          LocalData.savePref('photoURL', uid.photoURL);
          Get.back();
          Get.toNamed('/dashboard');
        } else {
          Get.back();

          Get.toNamed('/signup', arguments: uid);
        }
      });
    } on Exception catch (e) {
      print(e.toString());
      Get.back();
    }
  }

  Future apiRumkit() async {
    try {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: true);
      hasil.value = '';

      http.Response response = await http.get(
        'https://webapps.rsbhayangkaranganjuk.com/api-rsbnganjuk/api/v1/rumkit',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );
      var res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        rumkit = rumkitFromJson(response.body).data;
        Get.back();
      } else {
        Get.back();
        Get.snackbar(
          "Error",
          "Data tidak ditemukan",
        );
      }
    } on Exception catch (e) {
      print(e.toString());
      Get.back();
      Get.snackbar(
        "Error",
        "Gagal tersambung dengan server",
      );
    }
  }

  Future apiLogin() async {
    if (rumkitController.text.contains('Nganjuk')) {
      Get.dialog(Center(child: CircularProgressIndicator()),
          barrierDismissible: false);

      try {
        hasil.value = '';
        username.value = await LocalData.getPref('username');
        password.value = await LocalData.getPref('password');
        api.value = await LocalData.getPref('url');
        // var status = await OneSignal.shared.getPermissionSubscriptionState();
        // var playerId = status.subscriptionStatus.userId;

        var token = await TokenServices(
                '${api.value}token', username.value, password.value)
            .getToken();
        // print(token);
        http.Response response = await http.post(
          api.value + 'login',
          body: {
            'nrp': emailTextController.text,
            'ktp': passwordTextController.text
          },
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded",
            "Authorization": "Bearer " + token
          },
          encoding: Encoding.getByName("utf-8"),
        );
        var res = jsonDecode(response.body);
        print(res);

        if (response.statusCode == 200) {
          var rkm = loginFromJson(response.body).data;
          LocalData.savePref('no_rkm_medis', rkm.nip);
          LocalData.savePref('token', token.toString());
          LocalData.savePref('isGoogle', false);
          Get.back();
          hasil.value = 'valid';
        } else if (response.statusCode == 404) {
          Get.back();
          hasil.value = 'invalid';
          clearForm();
        } else {
          Get.back();
        }
      } on TimeoutException catch (e) {
        print('Timeout Error: $e');
        Get.back();
        hasil.value = 'timeout';
      } on SocketException catch (e) {
        print('Socket Error: $e');
        Get.back();
        hasil.value = 'socket';
      } on Error catch (e) {
        print('General Error: $e');
        Get.back();
        hasil.value = 'catch';
      }
    } else {
      hasil.value = 'notavailable';
    }
  }

  Future selectedRumkit(String rumkit, String urlApi, String urlBlog,
      String username, String password, String telp, String hc) async {
    LocalData.savePref('rumkit', rumkit);
    LocalData.savePref('username', username);
    LocalData.savePref('password', password);
    LocalData.savePref('url', urlApi);
    LocalData.savePref('urlBlog', urlBlog);
    LocalData.savePref('telp', telp);
    LocalData.savePref('hc', hc);
  }

  void clearForm() {
    emailTextController.text = "";
    passwordTextController.text = "";
    rumkitController.text = "";
  }

  // @override
  // void onClose() {
  //   emailTextController?.dispose();
  //   passwordTextController?.dispose();
  //   rumkitController?.dispose();
  //   super.onClose();
  // }
}
