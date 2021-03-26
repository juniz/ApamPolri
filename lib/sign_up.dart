import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/controller/signup_controller.dart';
import 'package:intl/intl.dart';

import 'controller/login_controller.dart';
import 'widget/datepicker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signupController = Get.put(SignUpController());
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();
  FocusNode myFocusNode6 = new FocusNode();
  FocusNode myFocusNode7 = new FocusNode();
  FocusNode myFocusNode8 = new FocusNode();
  FocusNode myFocusNode9 = new FocusNode();
  // User uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // signupController.nama.value = uid.displayName;
    // signupController.email.value = uid.email;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Text(
                    'Halaman Sign Up',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              onTap: () => modalApi(),
                              readOnly: true,
                              focusNode: myFocusNode9,
                              controller: signupController.rumkitController,
                              maxLines: 1,
                              validator: (value) => value.trim().isEmpty
                                  ? 'Rumah Sakit Masih Kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Rumkit",
                                hintText: "Pilih Rumkit",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.home),
                                suffixIcon: Icon(Icons.arrow_drop_down),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode1,
                              controller: signupController.nrpController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              validator: (value) => value.trim().isEmpty
                                  ? 'NRP masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "NRP",
                                hintText: "Isikan No. NRP",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.person),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode2,
                              controller: signupController.ktpController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              validator: (value) => value.length < 16
                                  ? 'KTP harus 16 digit'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "KTP",
                                hintText: "Isikan No. KTP",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.credit_card),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode3,
                              controller: signupController.namaController,
                              textCapitalization: TextCapitalization.characters,
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                              validator: (value) => value.trim().isEmpty
                                  ? 'Nama masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Nama",
                                hintText: "Isikan Nama",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.person),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode4,
                              controller: signupController.jkController,
                              maxLines: 1,
                              readOnly: true,
                              keyboardType: TextInputType.name,
                              onTap: () async {
                                await modalJK();
                              },
                              validator: (value) => value.trim().isEmpty
                                  ? 'Jenis Kelamin masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Jenis Kelamin",
                                hintText: "Isikan Jenis Kelamin",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.person),
                                suffixIcon: Icon(Icons.arrow_drop_down),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: MyTextFieldDatePicker(
                              labelText: "Pilih Tanggal Lahir",
                              prefixIcon: Icon(Icons.date_range),
                              suffixIcon: Icon(Icons.arrow_drop_down),
                              lastDate: DateTime.now().add(Duration(days: 1)),
                              firstDate: DateTime.now()
                                  .subtract(Duration(days: 999999999999999999)),
                              initialDate: DateTime.now(),
                              dateFormat: DateFormat('dd-MM-yyyy'),
                              onDateChanged: (selectedDate) {
                                // Do something with the selected date
                                signupController.tgl.value = selectedDate;
                              },
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.15,
                            child: TextFormField(
                              focusNode: myFocusNode8,
                              controller: signupController.alamatController,
                              maxLines: 3,
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.name,
                              validator: (value) => value.trim().isEmpty
                                  ? 'Alamat masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Alamat",
                                hintText: "Isikan Alamat",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.home),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode5,
                              controller: signupController.satuanController,
                              maxLines: 1,
                              textCapitalization: TextCapitalization.characters,
                              keyboardType: TextInputType.text,
                              validator: (value) => value.trim().isEmpty
                                  ? 'Kesatuan masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Kesatuan",
                                hintText: "Isikan Kesatuan",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.home_work),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode6,
                              controller: signupController.emailController,
                              maxLines: 1,
                              readOnly: false,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) =>
                                  value.isEmail ? null : 'Format email salah',
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Isikan Email",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.mail),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, left: 20, bottom: 20),
                          child: SizedBox(
                            height: Get.height * 0.07,
                            child: TextFormField(
                              focusNode: myFocusNode7,
                              controller: signupController.hpController,
                              maxLines: 1,
                              readOnly: false,
                              keyboardType: TextInputType.phone,
                              validator: (value) => value.trim().isEmpty
                                  ? 'No. Telp masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "No. Telp",
                                hintText: "Isikan No. Telp",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.phone),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 25,
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: SizedBox(
                    width: Get.width / 1.1,
                    child: RaisedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await signupController.saveParam();
                          await signupController.getOTP();
                          Get.toNamed('/otp',
                              arguments: signupController.param.value);
                          // if (signupController.hasil.value == '200') {
                          //   return AwesomeDialog(
                          //       context: context,
                          //       animType: AnimType.LEFTSLIDE,
                          //       headerAnimationLoop: false,
                          //       dialogType: DialogType.SUCCES,
                          //       title: 'Pendaftaran Berhasil',
                          //       desc:
                          //           'Silahkan Tunggu Notifikasi Dari Pihak Rumah Sakit',
                          //       btnOkIcon: Icons.check_circle,
                          //       onDissmissCallback: () {
                          //         // debugPrint('Dialog Dissmiss from callback');
                          //         Get.toNamed('/otp',
                          //             arguments: signupController.param.value);
                          //       }).show();
                          // } else {
                          //   return AwesomeDialog(
                          //           context: context,
                          //           dialogType: DialogType.ERROR,
                          //           animType: AnimType.RIGHSLIDE,
                          //           headerAnimationLoop: false,
                          //           title: 'Error',
                          //           desc: signupController.res.value,
                          //           btnOkOnPress: () {},
                          //           btnOkColor: Colors.red)
                          //       .show();
                          // }
                        }
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.green),
                      ),
                      color: Colors.green,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  modalJK() async {
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
                  itemCount: signupController.listJK.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                        signupController.listJK[index].text,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        signupController.jkController.text =
                            signupController.listJK[index].text;
                        signupController.selectedJK.value =
                            signupController.listJK[index].id;
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

  modalApi() async {
    await _loginController.apiRumkit();
    // _loginController.clearForm();
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference rumkit = firestore.collection('rumkit');
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                // child: StreamBuilder<QuerySnapshot>(
                //   stream: rumkit.snapshots(),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasData)
                //       return Container(
                //         child: ListView.separated(
                //           itemCount: snapshot.data.docs.length,
                //           itemBuilder: (context, index) {
                //             return ListTile(
                //               leading: Icon(Icons.home),
                //               title: Text(
                //                 snapshot.data.docs[index].data()['nama'],
                //                 style: TextStyle(color: Colors.black),
                //               ),
                //               onTap: () async {
                //                 _loginController.rumkitController.text =
                //                     snapshot.data.docs[index].data()['nama'];
                //                 await _loginController.selectedRumkit(
                //                     snapshot.data.docs[index].data()['urlApi'],
                //                     snapshot.data.docs[index]
                //                         .data()['username'],
                //                     snapshot.data.docs[index]
                //                         .data()['password']);
                //                 Get.back();
                //               },
                //             );
                //           },
                //           separatorBuilder: (BuildContext context, int index) {
                //             return Divider();
                //           },
                //         ),
                //       );
                //     else
                //       return Center(
                //         child: Text(
                //           'Loading.......',
                //         ),
                //       );
                //   },
                // ),
                child: ListView.separated(
                  itemCount: _loginController.rumkit.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.home_work),
                      title: Text(
                        _loginController.rumkit[index].rumkit,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        signupController.rumkitController.text =
                            _loginController.rumkit[index].rumkit;
                        await _loginController.selectedRumkit(
                            _loginController.rumkit[index].rumkit,
                            _loginController.rumkit[index].urlBase,
                            _loginController.rumkit[index].urlBlog,
                            _loginController.rumkit[index].username,
                            _loginController.rumkit[index].password,
                            _loginController.rumkit[index].telp,
                            _loginController.rumkit[index].hc);
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
}
