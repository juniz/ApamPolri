import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apam/models/profile_model.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {
  var profileList = Profile().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProfile();
    super.onInit();
  }

  // ignore: missing_return
  Future<List<Profile>> fetchProfile() async {
    try {
      isLoading(true);
      var response = await http
          .get("http://10.0.2.2/rest-polri/public/index.php/polri/" + "123456")
          .timeout(Duration(minutes: 2));
      var profile = profileFromJson(response.body);
      if (profile != null) {
        profileList.value = profile;
      }
    } finally {
      isLoading(false);
    }
  }
}
