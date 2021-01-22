import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/controller/detail_klinik_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKlinik extends StatelessWidget {
  final DashboardController dashboardController =
      Get.put((DashboardController()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff54D579), Color(0xFFE1E9EB)],
            begin: Alignment(0, -1.15),
            end: Alignment(0, 0.1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              child: Container(
                //padding: EdgeInsets.all(20),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset('assets/images/klinik.jpg'),
                ),
              ),
            ),
            Container(
              height: Get.height * 0.6,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Color(0xffF9F9F9),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dashboardController.nmPoli.value,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: dashboardController.detailKlinik.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: Color(0xffECF0F5)),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        width: 70,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Color(0xffD5E0FA),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              dashboardController.detailKlinik
                                                  .value[index].hariKerja,
                                              style: TextStyle(
                                                  color: Color(0xff3479C0),
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            dashboardController.detailKlinik
                                                .value[index].nmDokter,
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "${dashboardController.detailKlinik.value[index].jamMulai} s/d ${dashboardController.detailKlinik.value[index].jamSelesai}",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
