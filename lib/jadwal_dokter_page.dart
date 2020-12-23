import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/jadwal_dokter_controller.dart';

class JadwalDokterPage extends StatelessWidget {
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
              child: ListView.separated(
                itemCount: _jadwalDokterController.dokter.value.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.home_filled),
                    title: Text(
                      _jadwalDokterController.dokter.value.data[index].nmDokter,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                        'Jam Buka : ${_jadwalDokterController.dokter.value.data[index].jamMulai}\nJam Tutup : ${_jadwalDokterController.dokter.value.data[index].jamSelesai}'),
                    onTap: () async {},
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.calendar_today_rounded),
        onPressed: () {},
      ),
    );
  }
}
