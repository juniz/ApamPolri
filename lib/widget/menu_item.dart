import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String url;
  final String image;
  final double round;

  MenuItem({this.title, this.image, this.url, this.round});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Get.snackbar('Hi', 'Home Visite');
        Get.toNamed(url);
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(round),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                image,
                width: 60,
                height: 60,
                alignment: Alignment.center,
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }
}
