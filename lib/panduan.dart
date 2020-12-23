import 'package:flutter/material.dart';

class PanduanPage extends StatefulWidget {

  @override
  _PanduanPageState createState() => _PanduanPageState();
}

class _PanduanPageState extends State<PanduanPage> {
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
            Container(
              padding: EdgeInsets.fromLTRB(15,0,0,0),
              width: double.infinity,
              child: Text("1. Tentang Aplikasi",style:TextStyle(color:Colors.white70,fontSize: 15),textAlign: TextAlign.left,),
            ),
            ExpansionTile(
              title: Text("Apa itu APAM Bhayangkara?",style: TextStyle(color: Colors.white,fontSize: 17),),
              children: [
                Container(
                  padding : EdgeInsets.fromLTRB(20,0,10,0),
                  child: Text("Apam Bhayangkara adalah Aplikasi Pasien dan Aduan Masyarakat Nganjuk. Aplikasi yang diperuntukan bagi pasien yang ingin mendaftar online di Rumah Sakit Bhayangkara Nganjuk",style: TextStyle(color: Colors.white,fontSize: 15),textAlign: TextAlign.left,),),
              ],
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.fromLTRB(15,0,0,0),
              width: double.infinity,
              child: Text("2. Tentang Pelayanan Poliklinik",style:TextStyle(color:Colors.white70,fontSize: 15),textAlign: TextAlign.left,),
              ),
          ],
        ),
      ),     
    );
  }
}