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
  User uid = Get.arguments;

  @override
  Widget build(BuildContext context) {
    signupController.nama.value = uid.displayName;
    signupController.email.value = uid.email;
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
                              controller: signupController.namaController
                                ..text = uid.displayName,
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
                              focusNode: myFocusNode5,
                              controller: signupController.emailController
                                ..text = uid.email,
                              maxLines: 1,
                              readOnly: true,
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
                        await signupController.insert(uid);
                        signupController.clear();
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
}
