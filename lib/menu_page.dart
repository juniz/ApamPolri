import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width: Get.width,
            height: Get.height / 4,
            color: Colors.green,
          ),
          //SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: <Widget>[
                MenuItem(
                  title: 'Pendaftaran',
                  url: '/pendaftaran',
                  image: 'assets/icons/icons8-plus-96.png',
                  round: 20,
                ),
                MenuItem(
                  title: 'Jadwal Dokter',
                  url: '/jadwalDokter',
                  image: 'assets/icons/icons-planner.png',
                  round: 20,
                ),
                MenuItem(
                  title: 'Kamar',
                  url: '/kamar',
                  image: 'assets/icons/icons-bed.png',
                  round: 20,
                ),
                MenuItem(
                  title: 'Home Care',
                  url: '/homecare',
                  image: 'assets/icons/icons-hospital.png',
                  round: 20,
                ),
                MenuItem(
                  title: 'WhatsApp',
                  wa: '08994750136',
                  image: 'assets/icons/icons-whatsapp.png',
                  round: 20,
                ),
              ],
            ),
          ),
          Container(
            width: 350,
            height: Get.height / 3.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
