import 'package:apam/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode1 = new FocusNode();
  FocusNode myFocusNode2 = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Image.asset(
                    "assets/images/new-logo.jpg",
                    width: 150.0,
                    height: 300.0,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        focusNode: myFocusNode1,
                        controller: _loginController.emailTextController,
                        maxLines: 1,
                        validator: (value) =>
                            value.trim().isEmpty ? 'NRP masih kosong' : null,
                        decoration: InputDecoration(
                          labelText: "NRP",
                          hintText: "Isikan No. NRP",
                          fillColor: Colors.black,
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
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: TextFormField(
                        focusNode: myFocusNode2,
                        controller: _loginController.passwordTextController,
                        maxLines: 1,
                        validator: (value) =>
                            value.trim().isEmpty ? 'KTP masih kosong' : null,
                        decoration: InputDecoration(
                          labelText: "KTP",
                          hintText: "Isikan No. KTP",
                          fillColor: Colors.black,
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
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: Get.width / 1.5,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _loginController.apiLogin();
                          }
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: Text("Sign In", style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
