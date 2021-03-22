import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/controller/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController signupController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();
  FocusNode myFocusNode4 = new FocusNode();
  FocusNode myFocusNode5 = new FocusNode();
  FocusNode myFocusNode6 = new FocusNode();
  FocusNode myFocusNode7 = new FocusNode();
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
                flex: 14,
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
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                            height: 50,
                            child: TextFormField(
                              focusNode: myFocusNode2,
                              controller: signupController.ktpController,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              validator: (value) => value.trim().isEmpty
                                  ? 'KTP masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "KTP",
                                hintText: "Isikan No. KTP",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.credit_card),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                            height: 50,
                            child: TextFormField(
                              focusNode: myFocusNode3,
                              controller: signupController.namaController,
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
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                            height: 50,
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
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                            height: 50,
                            child: TextFormField(
                              focusNode: myFocusNode5,
                              controller: signupController.satuanController,
                              maxLines: 1,
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
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                            height: 50,
                            child: TextFormField(
                              focusNode: myFocusNode6,
                              controller: signupController.emailController,
                              maxLines: 1,
                              readOnly: false,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) => value.trim().isEmpty
                                  ? 'Email masih kosong'
                                  : null,
                              decoration: InputDecoration(
                                labelText: "Email",
                                hintText: "Isikan Email",
                                fillColor: Colors.black,
                                prefixIcon: Icon(Icons.mail),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
                            height: 50,
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
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.green),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
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
}
