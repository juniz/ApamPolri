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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Center(
                  child: Image.asset(
                    "assets/images/logo-app.png",
                    width: 150.0,
                    height: 300.0,
                  ),
                ),
                new Center(
                  child: Text("RS Bhayangkara Nganjuk",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
                new SizedBox(height: 20),
                new Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Text(
                      "Silahkan isikan nomor kartu berobat dan nomor KTP anda. Jika mengalami kesulitan silahkan hubungi petugas pengaduan di lobby Rumah Sakit",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
                new SizedBox(height: 50),
                new Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: _loginController.emailTextController,
                    maxLines: 1,
                    validator: (value) =>
                        value.trim().isEmpty ? 'Email required' : null,
                    decoration: InputDecoration(
                      labelText: "No. Kartu",
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                new SizedBox(height: 20),
                new Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: _loginController.passwordTextController,
                    maxLines: 1,
                    validator: (value) =>
                        value.trim().isEmpty ? 'Password required' : null,
                    decoration: InputDecoration(
                      labelText: "No. KTP",
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),
                new SizedBox(height: 50),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)),
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text("Batal", style: TextStyle(fontSize: 15)),
                      ),
                    ),
                    new SizedBox(
                      width: 20,
                    ),
                    new Container(
                      width: 150.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _loginController.apiLogin();
                          }
                        },
                        color: Colors.blue,
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
