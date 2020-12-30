import 'package:apam/widget/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'controller/pendaftaran_controller.dart';
import 'controller/login_controller.dart';

class PendaftaranPage extends StatefulWidget {
  @override
  _PendaftaranPageState createState() => _PendaftaranPageState();
}

class _PendaftaranPageState extends State<PendaftaranPage> {
  //final LoginController _loginController = Get.find();
  final PendaftaranController _pendaftaranController =
      Get.put(PendaftaranController());
  FocusNode myFocusNode1 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Pendaftaran'),
      //   backgroundColor: Colors.green,
      // ),
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height / 4,
            color: Colors.green,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: MyTextFieldDatePicker(
              labelText: "Pilih Tanggal",
              prefixIcon: Icon(Icons.date_range),
              suffixIcon: Icon(Icons.arrow_drop_down),
              lastDate: DateTime.now().add(Duration(days: 366)),
              firstDate: DateTime.now(),
              initialDate: DateTime.now().add(Duration(days: 1)),
              dateFormat: DateFormat('dd-MM-yyyy'),
              onDateChanged: (selectedDate) {
                // Do something with the selected date
                _pendaftaranController.tanggal.value.date = selectedDate;
                _pendaftaranController.clearInput();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: _pendaftaranController.api,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Pilih Rumah Sakit",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
                suffixIcon: Icon(Icons.arrow_drop_down),
                labelStyle: TextStyle(
                    color: myFocusNode1.hasFocus ? Colors.green : Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onTap: () async {
                modalApi();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: _pendaftaranController.poliklinik,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Pilih Poliklinik",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              onTap: () async {
                if (_pendaftaranController.selectedApi.value != "") {
                  modalPoli();
                } else {
                  Get.dialog(
                    AlertDialog(
                      title: Text('Rumah Sakit Masih Kosong'),
                      content: SizedBox(
                        width: 100,
                        height: 100,
                        child: LottieBuilder.asset(
                            "assets/animation/warning-sign.json"),
                      ),
                      actions: [
                        FlatButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Close'),
                        )
                      ],
                      elevation: 20.0,
                    ),
                  );
                }
              },
            ),
          ),
          //_homeVisiteController.dokterList != null ? listDokter(context) : '',
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: _pendaftaranController.dokter,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Pilih Dokter",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.arrow_drop_down),
                labelStyle: TextStyle(
                    color: myFocusNode1.hasFocus ? Colors.green : Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onTap: () async {
                modalDokter();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.save),
        onPressed: () async {
          _pendaftaranController.postPendaftaran();
        },
      ),
    );
  }

  modalPoli() async {
    await _pendaftaranController.fetchPoli();
    return Get.bottomSheet(
      Container(
        height: Get.height,
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.separated(
                          itemCount: _pendaftaranController.poliList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.home_filled),
                              title: Text(
                                _pendaftaranController.poliList[index].nmPoli,
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                  'Jam Buka : ${_pendaftaranController.poliList[index].jamMulai}\nJam Tutup : ${_pendaftaranController.poliList[index].jamSelesai}',
                                  style: TextStyle(color: Colors.black)),
                              onTap: () async {
                                _pendaftaranController.kdPoli.value.kdPoli =
                                    _pendaftaranController
                                        .poliList[index].kdPoli;
                                _pendaftaranController.poliklinik.text =
                                    _pendaftaranController
                                        .poliList[index].nmPoli;

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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  modalApi() async {
    await _pendaftaranController.fetchapi();
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: _pendaftaranController.apiList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        _pendaftaranController.apiList[index].nama,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        _pendaftaranController.selectedApi.value =
                            _pendaftaranController.apiList[index].api;
                        _pendaftaranController.api.text =
                            _pendaftaranController.apiList[index].nama;
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

  modalDokter() async {
    await _pendaftaranController.fetchDokter();
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: _pendaftaranController.dokterList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        _pendaftaranController.dokterList[index].nmDokter,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        _pendaftaranController.dokter.text =
                            _pendaftaranController.dokterList[index].nmDokter;
                        _pendaftaranController.kdDokter.value =
                            _pendaftaranController.dokterList[index].kdDokter;
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

  Widget listDokter(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: _pendaftaranController.dokterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _pendaftaranController.dokterList[index].nmDokter,
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
