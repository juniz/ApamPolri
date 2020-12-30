import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(
                () {
                  if (_jadwalDokterController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else {
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
                            onTap: () async {},
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.calendar_today_rounded),
        onPressed: () async {
          datePicker(context);
        },
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
