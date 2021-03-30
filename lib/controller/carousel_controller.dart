import 'package:apam/carousel_page.dart';
import 'package:apam/models/webcontent_model.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/photo_model.dart';
import 'package:apam/models/article_model.dart';
import 'dart:convert';

class CarouselPageController extends GetxController {
  final current = 0.obs;
  List<Photo> photoList = List<Photo>().obs;
  var articleList = List<WebContent>().obs;
  RxList url = [].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchPhoto();
    super.onInit();
  }

  void changeIndex(int index) {
    current.value = index;
  }

  Future fetchPhoto() async {
    try {
      isLoading(true);
      var request = await http.get(
          'https://rsbhayangkaranganjuk.com/wp-json/wp/v2/posts?per_page=5');
      if (request.statusCode == 200) {
        var data = webContentFromJson(request.body);
        print(request.body);
        articleList.value = data;
      } else {
        return null;
      }

      isLoading(false);
    } on Exception catch (e) {
      print(e);
      isLoading(false);
    }
  }
}
