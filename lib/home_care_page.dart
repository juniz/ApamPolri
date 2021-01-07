import 'package:apam/controller/home_care_controller.dart';
import 'package:apam/services/data_dummy.dart';
import 'package:apam/widget/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeCarePage extends StatefulWidget {
  @override
  _HomeCarePageState createState() => _HomeCarePageState();
}

class _HomeCarePageState extends State<HomeCarePage> {
  //final LoginController _loginController = Get.find();
  final HomeCareController _homecareController = Get.put(HomeCareController());
  FocusNode myFocusNode1 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              lastDate: DateTime.now().add(Duration(days: 7)),
              firstDate: DateTime.now(),
              initialDate: DateTime.now().add(Duration(days: 1)),
              dateFormat: DateFormat('dd-MM-yyyy'),
              onDateChanged: (selectedDate) {
                // Do something with the selected date
                _homecareController.tanggal.value.date = selectedDate;
                _homecareController.clearInput();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              controller: _homecareController.api,
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
              controller: _homecareController.dokter,
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
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: Get.width / 1.1,
            height: 50,
            child: RaisedButton.icon(
                onPressed: () {
                  _homecareController.postPendaftaran();
                },
                color: Colors.green,
                icon: Icon(Icons.person_add),
                label: Text(
                  'Daftar',
                  style: TextStyle(fontSize: 18),
                )),
          )
        ],
      ),
    );
  }

  modalPoli() async {
    await _homecareController.fetchPoli();
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
                          itemCount: _homecareController.poliList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Icon(Icons.home_filled),
                              title: Text(
                                _homecareController.poliList[index].nmPoli,
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                  'Jam Buka : ${_homecareController.poliList[index].jamMulai}\nJam Tutup : ${_homecareController.poliList[index].jamSelesai}',
                                  style: TextStyle(color: Colors.black)),
                              onTap: () async {
                                _homecareController.kdPoli.value.kdPoli =
                                    _homecareController.poliList[index].kdPoli;
                                _homecareController.poliklinik.text =
                                    _homecareController.poliList[index].nmPoli;

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
    //await _homecareController.fetchapi();
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
                        _homecareController.selectedApi.value =
                            DataDummy.dummy[index].api;
                        _homecareController.api.text =
                            DataDummy.dummy[index].nama;
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
    await _homecareController.fetchDokter();
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: _homecareController.dokterList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        _homecareController.dokterList[index].nmDokter,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        _homecareController.dokter.text =
                            _homecareController.dokterList[index].nmDokter;
                        _homecareController.kdDokter.value =
                            _homecareController.dokterList[index].kdDokter;
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
        itemCount: _homecareController.dokterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              _homecareController.dokterList[index].nmDokter,
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
