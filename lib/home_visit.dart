import 'package:apam/widget/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'controller/home_visite_controller.dart';
import 'controller/login_controller.dart';

class HomeVisitePage extends StatefulWidget {
  @override
  _HomeVisitePageState createState() => _HomeVisitePageState();
}

class _HomeVisitePageState extends State<HomeVisitePage> {
  //final LoginController _loginController = Get.find();
  final HomeVisiteController _homeVisiteController =
      Get.put(HomeVisiteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Visite'),
      ),
      body: Column(
        children: [
          MyTextFieldDatePicker(
            labelText: "Pilih Tanggal",
            prefixIcon: Icon(Icons.date_range),
            suffixIcon: Icon(Icons.arrow_drop_down),
            lastDate: DateTime.now().add(Duration(days: 366)),
            firstDate: DateTime.now(),
            initialDate: DateTime.now().add(Duration(days: 1)),
            dateFormat: DateFormat('dd-MM-yyyy'),
            onDateChanged: (selectedDate) {
              // Do something with the selected date
              _homeVisiteController.tanggal.value.date = selectedDate;
              _homeVisiteController.clearInput();
            },
          ),

          TextField(
            controller: _homeVisiteController.poliklinik,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Pilih Poliklinik",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.home),
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            onTap: () async {
              await _homeVisiteController.fetchPoli();
              modalPoli();
            },
          ),
          //_homeVisiteController.dokterList != null ? listDokter(context) : '',
          TextField(
            controller: _homeVisiteController.dokter,
            readOnly: true,
            decoration: InputDecoration(
              labelText: "Pilih Dokter",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
              suffixIcon: Icon(Icons.arrow_drop_down),
            ),
            onTap: () async {
              modalDokter();
            },
          ),
        ],
      ),
    );
  }

  modalPoli() {
    return Get.bottomSheet(
      Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                itemCount: _homeVisiteController.poliList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.home_filled),
                    title: Text(
                      _homeVisiteController.poliList[index].nmPoli,
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                        'Jam Buka : ${_homeVisiteController.poliList[index].jamMulai}\nJam Tutup : ${_homeVisiteController.poliList[index].jamSelesai}'),
                    onTap: () async {
                      _homeVisiteController.kdPoli.value.kdPoli =
                          _homeVisiteController.poliList[index].kdPoli;
                      _homeVisiteController.poliklinik.text =
                          _homeVisiteController.poliList[index].nmPoli;

                      //await _homeVisiteController.fetchDokter();
                      //print(_homeVisiteController.dokterList);
                      Get.back();
                    },
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
    );
  }

  modalDokter() async {
    await _homeVisiteController.fetchDokter();
    return Get.bottomSheet(
      Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                itemCount: _homeVisiteController.dokterList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      _homeVisiteController.dokterList[index].nmDokter,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () async {
                      _homeVisiteController.dokter.text =
                          _homeVisiteController.dokterList[index].nmDokter;

                      //await _homeVisiteController.fetchDokter();
                      //print(_homeVisiteController.dokterList);
                      Get.back();
                    },
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
    );
  }

  Widget listDokter(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: _homeVisiteController.dokterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _homeVisiteController.dokterList[index].nmDokter,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            leading: Radio(value: null, groupValue: null, onChanged: null),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
