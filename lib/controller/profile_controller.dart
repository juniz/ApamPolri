import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:apam/services/preference.dart';
import 'package:apam/services/url.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/profile_model.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profil = Profile().obs;
  var isLoading = true.obs;
  var rkm = "".obs;
  final box = GetStorage();

  @override
  void onInit() {
    rkm.value = box.read('no_rkm_medis');
    fetchProfile();
    super.onInit();
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

  void logout() async {
    await LocalData.delPref('no_rkm_medis');
    Get.offAllNamed("/login");
  }
}
