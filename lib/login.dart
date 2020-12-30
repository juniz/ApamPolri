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
                Container(
                  margin: EdgeInsets.all(25),
                  width: Get.width,
                  height: Get.height / 3.5,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 20.0,
                        shadowColor: Colors.blue,
                        child: TextFormField(
                          focusNode: myFocusNode1,
                          controller: _loginController.emailTextController,
                          maxLines: 1,
                          validator: (value) =>
                              value.trim().isEmpty ? 'Email required' : null,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: myFocusNode1.hasFocus
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            labelText: "No. Kartu",
                            fillColor: Colors.black,
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
                      SizedBox(
                        height: 30,
                      ),
                      Material(
                        elevation: 20.0,
                        shadowColor: Colors.blue,
                        child: TextFormField(
                          focusNode: myFocusNode2,
                          controller: _loginController.passwordTextController,
                          maxLines: 1,
                          validator: (value) =>
                              value.trim().isEmpty ? 'Password required' : null,
                          decoration: InputDecoration(
                            labelText: "No. KTP",
                            fillColor: Colors.black,
                            labelStyle: TextStyle(
                                color: myFocusNode2.hasFocus
                                    ? Colors.blue
                                    : Colors.black),
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
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(3, 4),
                      ),
                    ],
                  ),
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
                      width: 150.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        color: Colors.green,
                        textColor: Colors.black,
                        child: Text("Batal", style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 150.0,
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
                        textColor: Colors.black,
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
