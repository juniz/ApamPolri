import 'package:apam/carousel_page.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:apam/models/photo_model.dart';
import 'package:apam/models/article_model.dart';
import 'dart:convert';

class CarouselPageController extends GetxController {
  final current = 0.obs;
  List<Photo> photoList = List<Photo>().obs;
  List<ArticleElement> articleList = List<ArticleElement>().obs;
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

  void fetchPhoto() async {
    try {
      isLoading(true);
      var request = await http.get(
          'https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=199bdb149a8641e5b36d7153b2d68f0a&pageSize=5');
      var data = articleFromJson(request.body).articles;

      articleList = data;

      isLoading(false);
    } on Exception catch (e) {
      print(e);
      //isLoading(false);
    }
  }
}
