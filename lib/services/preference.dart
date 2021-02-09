import 'package:get_storage/get_storage.dart';

class LocalData {
  static var box = GetStorage();

  static savePref(String key, var value) {
    box.write(key, value);
  }

  static Future<String> getPref(String key) async {
    return await box.read(key);
  }

  static delPref(String key) {
    box.remove(key);
  }
}
