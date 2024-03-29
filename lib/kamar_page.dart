import 'package:apam/controller/kamar_controller.dart';
import 'package:apam/services/data_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/login_controller.dart';

class KamarPage extends StatelessWidget {
  final KamarController kamarController = Get.put((KamarController()));
  final LoginController _loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Ketersediaan Kamar"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(
                () {
                  if (kamarController.selectedApi.value == "") {
                    return Center(
                      child: Text(
                        'Pilih Rumah Sakit Terlebih Dahulu',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else if (kamarController.hasil.value == 'notavailable') {
                    return Center(
                      child: Text(
                        'Layanan ${kamarController.selectedApi.value} Belum Tersedia',
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  } else {
                    return ListView.separated(
                      itemCount: kamarController.kamarList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.king_bed),
                          title: Text(
                            '${kamarController.kamarList[index].kelas}\nTersedia : ${kamarController.kamarList[index].kosong}',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                              'Kapasitas : ${kamarController.kamarList[index].total}'),
                          onTap: () async {},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 45.0,
          color: Colors.green,
          child: FlatButton.icon(
            onPressed: () {
              modalApi();
            },
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: Text(
              "Pilih Rumah Sakit",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }

  modalApi() async {
    await _loginController.apiRumkit();
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: _loginController.rumkit.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.local_post_office),
                      title: Text(
                        _loginController.rumkit[index].rumkit,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        kamarController.selectedApi.value =
                            _loginController.rumkit[index].urlBase;
                        kamarController.username.value =
                            _loginController.rumkit[index].username;
                        kamarController.password.value =
                            _loginController.rumkit[index].password;
                        await kamarController.fetchKamar();
                        Get.back();
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

  // modalApi() async {
  //   //await kamarController.fetchapi();
  //   return Get.bottomSheet(
  //     Container(
  //       color: Colors.white,
  //       child: Column(
  //         children: <Widget>[
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: ListView.separated(
  //                 itemCount: DataDummy.dummy.length,
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     leading: Icon(Icons.home),
  //                     title: Text(
  //                       DataDummy.dummy[index].nama,
  //                       style: TextStyle(color: Colors.black),
  //                     ),
  //                     onTap: () async {
  //                       kamarController.selectedApi.value =
  //                           DataDummy.dummy[index].nama;
  //                       kamarController.fetchKamar();
  //                       Get.back();
  //                     },
  //                   );
  //                 },
  //                 separatorBuilder: (BuildContext context, int index) {
  //                   return Divider();
  //                 },
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
