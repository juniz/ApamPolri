import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo-app.png",
                width: 150.0,
                height: 300.0,
              ),
            ),
            Center(
              child: Text("APAM Bhayangkara",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              "Aplikasi Pasien dan Antrian Mandiri",
              style: TextStyle(color: Colors.black),
            )),
            SizedBox(
              height: 200,
            ),
            Container(
              width: Get.width / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(5, 3),
                  ),
                ],
              ),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.lightGreenAccent[400])),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                color: Colors.lightGreenAccent[400],
                textColor: Colors.black,
                child: Text("Sign In", style: TextStyle(fontSize: 20)),
              ),
            ),
            // SizedBox(
            //   width: 350,
            //   child: RaisedButton(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(18.0),
            //         side: BorderSide(color: Colors.white)),
            //     onPressed: () {
            //       Navigator.pushNamed(context, '/panduan');
            //     },
            //     color: Colors.green,
            //     textColor: Colors.black,
            //     child: Text("Panduan", style: TextStyle(fontSize: 15)),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
