import 'package:apam/controller/login_controller.dart';
import 'package:apam/services/data_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:apam/widget/awesome_dialog_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apam/models/rumkit_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  FocusNode myFocusNode3 = new FocusNode();

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Halaman Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(height: 20),
              ),
              Expanded(
                flex: 10,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              focusNode: myFocusNode1,
                              controller: _loginController.emailTextController,
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
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              focusNode: myFocusNode2,
                              controller:
                                  _loginController.passwordTextController,
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
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: SizedBox(
                            height: 50,
                            child: TextFormField(
                              onTap: () => modalApi(),
                              readOnly: true,
                              focusNode: myFocusNode3,
                              controller: _loginController.rumkitController,
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
                      ],
                    ),
                  ),
                ),
              ),

              Expanded(
                flex: 1,
                child: SizedBox(height: 20),
              ),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.only(left: 10, right: 10),
              // ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        width: Get.width / 1.1,
                        // height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(color: Colors.green)),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await _loginController.apiLogin();
                              if (_loginController.hasil.value == 'valid') {
                                Get.offAllNamed("/dashboard");
                              } else if (_loginController.hasil.value ==
                                  'invalid') {
                                return AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.RIGHSLIDE,
                                        headerAnimationLoop: false,
                                        title: 'Error',
                                        desc: 'Nomor NRP atau KTP Salah',
                                        btnOkOnPress: () {},
                                        btnOkColor: Colors.red)
                                    .show();
                              } else if (_loginController.hasil.value ==
                                  'notavailable') {
                                return AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.RIGHSLIDE,
                                        headerAnimationLoop: false,
                                        title: 'Error',
                                        desc:
                                            'Layanan ${_loginController.rumkitController.text} Belum Tersedia\nSilahkan Pilih Rumkit Yang Lain',
                                        btnOkOnPress: () {},
                                        btnOkColor: Colors.red)
                                    .show();
                              } else {
                                return AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.ERROR,
                                        animType: AnimType.RIGHSLIDE,
                                        headerAnimationLoop: false,
                                        title: 'Error',
                                        desc:
                                            'Tidak Bisa Terhubung Dengan Internet',
                                        btnOkOnPress: () {},
                                        btnOkColor: Colors.red)
                                    .show();
                              }
                            }
                          },
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text("Sign In",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: SizedBox(
                    //     width: Get.width / 1.1,
                    //     child: SignInButton(
                    //       Buttons.GoogleDark,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(30.0),
                    //       ),
                    //       onPressed: () async {
                    //         await modalApi();
                    //         if (_loginController.rumkitController.text != "") {
                    //           await _loginController.signInWithGoogle();
                    //           _loginController.cek();
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed('/signup');
                        },
                        child: SizedBox(
                          child: Text(
                            'Belum punya akun? Registrasi disini.',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(child: SizedBox(height: 30)),
            ],
          ),
        ),
      ),
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
                      leading: Icon(Icons.home),
                      title: Text(
                        _loginController.rumkit[index].rumkit,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () async {
                        _loginController.rumkitController.text =
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
