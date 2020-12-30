import 'dart:convert';

import 'package:apam/models/kamar_model.dart';
import 'package:apam/services/url.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

class KamarController extends GetxController {
  var kamarList = List<Kamar>().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchKamar();
    super.onInit();
  }

  Future<List<Kamar>> fetchKamar() async {
    try {
      isLoading(true);
      var response = await http
          .post(urlBase,
              headers: {
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded"
              },
              body: {'action': 'kamar'},
              encoding: Encoding.getByName("utf-8"))
          .timeout(Duration(minutes: 2));
      var data = kamarFromJson(response.body);
      if (data != null) {
        kamarList.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
