import 'package:apam/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apam/services/url.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RS Bhayangkara Nganjuk"),
        leading: Image.asset("assets/images/logo-app.png"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width: double.infinity,
            height: 200.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: FittedBox(
                child: Image.asset("assets/images/rshd.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                MenuItem(
                  title: 'Home Visite',
                  url: '/homevisite',
                  image: 'assets/images/logo-app.png',
                  round: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                MenuItem(
                  title: 'Jadwal Dokter',
                  url: '/jadwalDokter',
                  image: 'assets/images/logo-app.png',
                  round: 20,
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Container(
            width: 350,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
