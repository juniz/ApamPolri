import 'package:apam/carousel_page.dart';
import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/models/booking_model.dart';
import 'package:apam/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      title: 'Riwayat',
                      url: '/riwayat',
                      image: 'assets/icons/history.png',
                      round: 20,
                    ),
                    MenuItem(
                      title: 'Hubungi Kami',
                      wa: '628113130690',
                      image: 'assets/icons/icons-whatsapp.png',
                      round: 20,
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 350,
              //   height: Get.height / 2.8,
              //   padding: const EdgeInsets.all(4.0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.all(4),
              //         child: Text("Booking Pendaftaran", textAlign: TextAlign.left),
              //       ),
              //       Divider(
              //         thickness: 1.5,
              //       ),
              //       Flexible(
              //         child: Obx(
              //           () {
              //             if (dasboardController.isLoading.value)
              //               return Center(child: CircularProgressIndicator());
              //             else
              //               return RefreshIndicator(
              //                 onRefresh: () async {
              //                   dasboardController.fetchBooking();
              //                 },
              //                 child: ListView.separated(
              //                     //shrinkWrap: true,
              //                     physics: const BouncingScrollPhysics(
              //                         parent: AlwaysScrollableScrollPhysics()),
              //                     itemBuilder: (context, index) {
              //                       return ListTile(
              //                         trailing: Icon(Icons.arrow_drop_down),
              //                         title: Column(
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           mainAxisAlignment: MainAxisAlignment.center,
              //                           children: <Widget>[
              //                             Text(
              //                               '${DateFormat('dd-MM-yyyy').format(dasboardController.bookList[index].tanggalPeriksa)}/${dasboardController.bookList[index].status}',
              //                               style: TextStyle(
              //                                   color: Colors.black, fontSize: 12),
              //                             ),
              //                             Text(
              //                               '${dasboardController.bookList[index].nmPoli}',
              //                               style: TextStyle(
              //                                   color: Colors.black, fontSize: 15),
              //                             ),
              //                             Text(
              //                               '${dasboardController.bookList[index].nmDokter}',
              //                               style: TextStyle(
              //                                   color: Colors.black, fontSize: 15),
              //                             ),
              //                           ],
              //                         ),
              //                         onTap: () {
              //                           modalDetailBooking(
              //                               dasboardController.bookList[index]);
              //                         },
              //                       );
              //                     },
              //                     separatorBuilder: (context, index) {
              //                       return Padding(
              //                         padding: const EdgeInsets.only(left: 12.0),
              //                         child: Divider(
              //                           thickness: 1.5,
              //                         ),
              //                       );
              //                     },
              //                     itemCount: dasboardController.bookList.length),
              //               );
              //           },
              //         ),
              //       ),
              //     ],
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(
              //       Radius.circular(10),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         blurRadius: 5,
              //         offset: Offset(2, 3),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text(
                  "Daftar Poliklinik",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 400,
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
                                          // SizedBox(
                                          //   width: 15,
                                          // ),
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

  modalDetailBooking(Booking data) async {
    return Get.bottomSheet(
      Container(
        width: 200,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: GestureDetector(
                        child: Icon(Icons.close),
                        onTap: () => Get.back(),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text(
                    'Tanggal Daftar : ${DateFormat('dd-MM-yyyy').format(data.tanggalBooking)}'),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text(
                    'Tanggal Periksa : ${DateFormat('dd-MM-yyyy').format(data.tanggalPeriksa)}'),
              ),
              ListTile(
                leading: Icon(Icons.all_inbox),
                title: Text('Status : ${data.status}'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Klinik : ${data.nmPoli}'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Dokter : ${data.nmDokter}'),
              ),
              ListTile(
                leading: Icon(Icons.wallet_membership),
                title: Text('Nomor Antrian : ${data.noReg}'),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Cara Bayar : ${data.pngJawab}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
