import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
              child: Column(
          children: [
            Center(
              child:Image.asset("assets/images/logo-app.png",width: 150.0,height: 300.0,),
            ),
            Center(
              child: Text("APAM Bhayangkara",style:TextStyle(color:Colors.white,fontSize: 20)),
            ),
            SizedBox(height: 20),
            Center(
              child:Text("Aplikasi Pasien dan Antrian Mandiri",style: TextStyle(color: Colors.white),)
            ),
            SizedBox(height: 300,),
            SizedBox(
              width: 350,
              child:RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Sign In",
                  style: TextStyle(fontSize: 15)),
              ),
            ),
            SizedBox(
              width: 350,
              child:RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/panduan');
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Panduan",
                  style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),     
    );
  }
}