import 'package:flutter/material.dart';
import 'package:get/get.dart';

modalDaftar() {
  return Get.bottomSheet(Container(
    color: Colors.grey,
    child: Column(
      children: [
        Text(
          "Pendaftaran",
          style: TextStyle(color: Colors.black),
        )
      ],
    ),
  ));
}
