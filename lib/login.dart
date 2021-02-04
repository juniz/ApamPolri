import 'package:apam/controller/login_controller.dart';
import 'package:apam/services/data_dummy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:apam/widget/awesome_dialog_screen.dart';

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
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 6,
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
                flex: 8,
                child: Form(
                  key: _formKey,
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 20, left: 20),
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                focusNode: myFocusNode1,
                                controller:
                                    _loginController.emailTextController,
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
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
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2),
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
              ),

              // SizedBox(height: 20),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.only(left: 10, right: 10),
              // ),
              Expanded(child: SizedBox(height: 30)),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width / 1.1,
                      height: 50,
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

  modalApi() {
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
                      leading: Icon(Icons.home),
                      title: Text(
                        DataDummy.dummy[index].nama,
                        style: TextStyle(color: Colors.black),
                      ),
                      onTap: () {
                        _loginController.rumkitController.text =
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
}
