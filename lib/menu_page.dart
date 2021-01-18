import 'package:apam/carousel_page.dart';
import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/models/booking_model.dart';
import 'package:apam/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashboardController dasboardController =
        Get.put((DashboardController()));
    return Container(
      color: Colors.grey[100],
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: Get.width,
                color: Color(0xffECF0F5),
                child: CarouselPage(),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Wrap(
              //     children: <Widget>[
              //       MenuItem(
              //         title: 'Pendaftaran',
              //         url: '/pendaftaran',
              //         image: 'assets/icons/icons8-plus-96.png',
              //         round: 20,
              //       ),
              //       MenuItem(
              //         title: 'Jadwal Dokter',
              //         url: '/jadwalDokter',
              //         image: 'assets/icons/icons-planner.png',
              //         round: 20,
              //       ),
              //       MenuItem(
              //         title: 'Kamar',
              //         url: '/kamar',
              //         image: 'assets/icons/icons-bed.png',
              //         round: 20,
              //       ),
              //       MenuItem(
              //         title: 'Home Care',
              //         url: '/homecare',
              //         image: 'assets/icons/icons-hospital.png',
              //         round: 20,
              //       ),
              //       MenuItem(
              //         title: 'Riwayat',
              //         url: '/riwayat',
              //         image: 'assets/icons/history.png',
              //         round: 20,
              //       ),
              //       MenuItem(
              //         title: 'Hubungi Kami',
              //         wa: '628113130690',
              //         image: 'assets/icons/icons-whatsapp.png',
              //         round: 20,
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width,
                height: 60,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Get.toNamed('/pendaftaran');
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Pendaftaran",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Get.toNamed('/homecare');
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.home_work,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Home Care",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Get.toNamed('/jadwalDokter');
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Jadwal Dokter",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Get.toNamed('/kamar');
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.single_bed,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Kamar",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          FlutterOpenWhatsapp.sendSingleMessage(
                              "628113130690", "Hello");
                        },
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Hubungi Kami",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 17,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text(
                  "Daftar Poliklinik",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                child: SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: dasboardController.klinikList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 20, right: 20),
                                child: InkWell(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                      color: Color(0xffECF0F5),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(7),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: 70,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/icons/category2.png'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              dasboardController.klinikList
                                                  .value[index].nmPoli,
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () async {
                                    dasboardController.kdPoli.value =
                                        dasboardController
                                            .klinikList.value[index].kdPoli;
                                    dasboardController.nmPoli.value =
                                        dasboardController
                                            .klinikList.value[index].nmPoli;
                                    await dasboardController.fetchJadwal();
                                    Get.toNamed('/detailklinik');
                                  },
                                ),
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ]),
      ),
    );
  }
}
