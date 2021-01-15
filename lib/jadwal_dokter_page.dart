import 'package:apam/services/data_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'controller/jadwal_dokter_controller.dart';

class JadwalDokterPage extends StatefulWidget {
  @override
  _JadwalDokterPageState createState() => _JadwalDokterPageState();
}

class _JadwalDokterPageState extends State<JadwalDokterPage> {
  final JadwalDokterController _jadwalDokterController =
      Get.put(JadwalDokterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jadwal Dokter"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(() {
                if (_jadwalDokterController.jadwalDokter.length < 1) {
                  return Center(
                    child: Text(
                      'Pilih Rumah Sakit Terlebih Dahulu',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.separated(
                      itemCount: _jadwalDokterController.jadwalDokter.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image(
                            image: AssetImage(
                                'assets/images/${_jadwalDokterController.jadwalDokter[index].jk}.png'),
                          ),
                          title: Text(
                            _jadwalDokterController
                                .jadwalDokter[index].nmDokter,
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                              'Jam Buka : ${_jadwalDokterController.jadwalDokter[index].jamMulai}\nJam Tutup : ${_jadwalDokterController.jadwalDokter[index].jamSelesai}'),
                          onTap: () async {
                            _jadwalDokterController.kdDokter.value =
                                _jadwalDokterController
                                    .jadwalDokter[index].kdDokter;
                            modalDetailDokter();
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   child: Icon(Icons.calendar_today_rounded),
      //   onPressed: () async {
      //     datePicker(context);
      //   },
      // ),
      bottomNavigationBar: Container(
          height: 45.0,
          color: Colors.green,
          child: FlatButton.icon(
            onPressed: () {
              modalApi();
            },
            icon: Icon(Icons.home),
            label: Text(
              "Pilih Rumah Sakit",
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }

  modalApi() async {
    //await _jadwalDokterController.fetchapi();
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
                      leading: Icon(Icons.person),
                      title: Text(
                        DataDummy.dummy[index].nama,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        _jadwalDokterController.selectedApi.value =
                            DataDummy.dummy[index].api;
                        _jadwalDokterController.fetchDokter();
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

  modalDetailDokter() async {
    await _jadwalDokterController.fetchDetail();
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: _jadwalDokterController.detailDokter.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      isThreeLine: true,
                      leading: Icon(Icons.calendar_today),
                      title: Text(
                          '${_jadwalDokterController.detailDokter.value[index].nmPoli}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Hari       :  ${_jadwalDokterController.detailDokter.value[index].hariKerja}'),
                          Text(
                              'Mulai     :  ${_jadwalDokterController.detailDokter.value[index].jamMulai}'),
                          Text(
                              'Selesai  :  ${_jadwalDokterController.detailDokter.value[index].jamSelesai}'),
                        ],
                      ),
                      onTap: () async {
                        // _jadwalDokterController.selectedApi.value =
                        //     DataDummy.dummy[index].api;
                        // _jadwalDokterController.fetchDokter();
                        // Get.back();
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

  Future<Null> datePicker(BuildContext context) async {
    final DateTime _pickedDate = await showDatePicker(
      context: context,
      initialDate: _jadwalDokterController.tanggal.value.tgl,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 366)),
    );
    if (_pickedDate != null) {
      _jadwalDokterController.tanggal.value.tgl = _pickedDate;
      _jadwalDokterController.fetchDokter();
    }
  }
}
