import 'package:apam/services/data_dummy.dart';
import 'package:apam/widget/alert_dialog.dart';
import 'package:apam/widget/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'controller/pendaftaran_controller.dart';
import 'package:apam/models/booking_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:apam/widget/awesome_dialog_screen.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pendaftaran Umum'),
          backgroundColor: Colors.green,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Daftar',
              ),
              Tab(text: 'Riwayat'),
            ],
          ),
        ),
        body: TabBarView(children: [
          Column(
            children: [
              // Container(
              //   width: Get.width,
              //   height: Get.height / 4,
              //   color: Colors.green,
              // ),
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
                        color: myFocusNode1.hasFocus
                            ? Colors.green
                            : Colors.black),
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
                    labelStyle: TextStyle(
                        color: myFocusNode1.hasFocus
                            ? Colors.green
                            : Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onTap: () async {
                    if (_pendaftaranController.selectedApi.value != "") {
                      modalPoli();
                    } else {
                      return AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: false,
                              title: 'Error',
                              desc: 'Ada Data Yang Masih Kosong',
                              btnOkOnPress: () {},
                              btnOkColor: Colors.red)
                          .show();
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
                        color: myFocusNode1.hasFocus
                            ? Colors.green
                            : Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onTap: () async {
                    if (_pendaftaranController.selectedApi.value != "" &&
                        _pendaftaranController.poliklinik.text != "") {
                      await modalDokter();
                    } else {
                      return AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.RIGHSLIDE,
                              headerAnimationLoop: false,
                              title: 'Error',
                              desc: 'Ada Data Yang Masih Kosong',
                              btnOkOnPress: () {},
                              btnOkColor: Colors.red)
                          .show();
                    }
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
                    onPressed: () async {
                      await _pendaftaranController.postPendaftaran();
                      if (_pendaftaranController.hasil.value == 'success') {
                        return AwesomeDialog(
                            context: context,
                            animType: AnimType.LEFTSLIDE,
                            headerAnimationLoop: false,
                            dialogType: DialogType.SUCCES,
                            title: 'Succes',
                            desc:
                                'Berhasil Terdaftar di ${_pendaftaranController.poliklinik.text} ${_pendaftaranController.api.text}',
                            btnOkIcon: Icons.check_circle,
                            onDissmissCallback: () {
                              Get.toNamed('/dashboard');
                            }).show();
                      } else if (_pendaftaranController.hasil.value ==
                          'limit') {
                        return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.RIGHSLIDE,
                                headerAnimationLoop: false,
                                title: 'Error',
                                desc:
                                    'Kuota ${_pendaftaranController.poliklinik.text} Pada Tanggal ${DateFormat('dd-MM-yyyy').format(_pendaftaranController.tanggal.value.date)} Penuh',
                                btnOkOnPress: () {},
                                btnOkColor: Colors.red)
                            .show();
                      } else if (_pendaftaranController.hasil.value ==
                          'duplicate') {
                        return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.RIGHSLIDE,
                                headerAnimationLoop: false,
                                title: 'Error',
                                desc:
                                    'Anda Sudah Terdaftar Pada ${_pendaftaranController.poliklinik.text} Tanggal ${DateFormat('dd-MM-yyyy').format(_pendaftaranController.tanggal.value.date)}',
                                btnOkOnPress: () {},
                                btnOkColor: Colors.red)
                            .show();
                      } else if (_pendaftaranController.hasil.value == 'fail') {
                        return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.RIGHSLIDE,
                                headerAnimationLoop: false,
                                title: 'Error',
                                desc: 'Pendaftaran Gagal',
                                btnOkOnPress: () {},
                                btnOkColor: Colors.red)
                            .show();
                      } else if (_pendaftaranController.hasil.value ==
                          'notavailable') {
                        return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.RIGHSLIDE,
                                headerAnimationLoop: false,
                                title: 'Error',
                                desc:
                                    'Layanan ${_pendaftaranController.api.text} Belum Tersedia\nSilahkan Pilih Rumkit Yang Lain',
                                btnOkOnPress: () {
                                  _pendaftaranController.clearInput();
                                },
                                btnOkColor: Colors.red)
                            .show();
                      } else {
                        return AwesomeDialog(
                                context: context,
                                dialogType: DialogType.ERROR,
                                animType: AnimType.RIGHSLIDE,
                                headerAnimationLoop: false,
                                title: 'Error',
                                desc: 'Tidak Bisa Terhubung Dengan Internet',
                                btnOkOnPress: () {},
                                btnOkColor: Colors.red)
                            .show();
                      }
                    },
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    icon: Icon(Icons.person_add, color: Colors.white),
                    label: Text(
                      'Daftar',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
              )
            ],
          ),
          Container(
            width: 350,
            height: Get.height / 2.8,
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    "Booking Pendaftaran",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Flexible(
                  child: Obx(
                    () {
                      if (_pendaftaranController.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else
                        return RefreshIndicator(
                          onRefresh: () async {
                            _pendaftaranController.fetchBooking();
                          },
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  trailing: Icon(Icons.arrow_drop_down),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '${DateFormat('dd-MM-yyyy').format(_pendaftaranController.bookList[index].tanggalPeriksa)}/${_pendaftaranController.bookList[index].status}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                      Text(
                                        '${_pendaftaranController.bookList[index].nmPoli}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      Text(
                                        '${_pendaftaranController.bookList[index].nmDokter}',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    modalDetailBooking(
                                        _pendaftaranController.bookList[index]);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Divider(
                                    thickness: 1.5,
                                  ),
                                );
                              },
                              itemCount:
                                  _pendaftaranController.bookList.length),
                        );
                    },
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  offset: Offset(2, 3),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  modalPoli() async {
    if (_pendaftaranController.api.text.contains('Nganjuk')) {
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
                            separatorBuilder:
                                (BuildContext context, int index) {
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
    } else {
      return Get.bottomSheet(
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'Layanan Belum Tersedia',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }
  }

  modalApi() async {
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
                        _pendaftaranController.selectedApi.value =
                            DataDummy.dummy[index].api;
                        _pendaftaranController.api.text =
                            DataDummy.dummy[index].nama;
                        _pendaftaranController.poliklinik.text = "";
                        _pendaftaranController.dokter.text = "";
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
    if (_pendaftaranController.api.text.contains('Nganjuk')) {
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
    } else {
      return Get.bottomSheet(
        Container(
          color: Colors.white,
          child: Center(
            child: Text(
              'Layanan Belum Tersedia',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }
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
