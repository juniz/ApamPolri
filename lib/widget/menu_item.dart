import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String url;
  final String image;
  final double round;
  final String wa;

  MenuItem({this.title, this.image, this.url, this.round, this.wa});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          Get.toNamed(url);
        } else {
          FlutterOpenWhatsapp.sendSingleMessage(wa, "Hello");
        }
      },
      child: Container(
        margin: EdgeInsets.all(10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(round),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(2, 3),
              )
            ]),
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
