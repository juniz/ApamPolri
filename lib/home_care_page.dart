import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 4,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
