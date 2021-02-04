import 'package:apam/carousel_page.dart';
import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/models/booking_model.dart';
import 'package:apam/services/data_dummy.dart';
import 'package:apam/widget/menu_item.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
              SizedBox(
                height: 10,
              ),
              Container(
                width: Get.width,
                height: 50,
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
                              Icons.book,
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
                              Icons.event_available,
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
                          modalApi(context);
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
                height: 10,
              ),
              Material(
                elevation: 5,
                child: Container(
                  width: Get.width,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 17, top: 10),
                    child: Text(
                      "Daftar Poliklinik",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      Obx(() => ListView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            itemCount: dasboardController.klinikList.length,
                            itemBuilder: (context, index) {
                              if (dasboardController.isLoading.value == true) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else {
                                return Container(
                                  margin: EdgeInsets.only(right: 20, left: 20),
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
                                        // padding: EdgeInsets.only(left: 20),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/icons/hospital-flat.png'),
                                                        fit: BoxFit.fitHeight)),
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
                                                  fontSize: 15,
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
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ]),
      ),
    );
  }

  modalApi(BuildContext context) async {
    //await _pendaftaranController.fetchapi();
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: DataDummy.dummy.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.home),
                      title: Text(
                        DataDummy.dummy[index].nama,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        if (DataDummy.dummy[index].nama.contains('Nganjuk')) {
                          Get.back();
                          FlutterOpenWhatsapp.sendSingleMessage(
                              "628113130690", "Hello");
                        } else {
                          // Get.back();
                          return AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: false,
                                  title: 'Error',
                                  desc:
                                      'Layanan ${DataDummy.dummy[index].nama} Belum Tersedia\nSilahkan Pilih Rumkit Yang Lain',
                                  btnOkOnPress: () {
                                    Get.back();
                                  },
                                  btnOkColor: Colors.red)
                              .show();
                        }
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
