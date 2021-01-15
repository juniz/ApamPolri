import 'package:apam/controller/dasboard_controller.dart';
import 'package:apam/widget/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DashboardController dasboardController =
      Get.put((DashboardController()));
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   title: Text("RS Bhayangkara Nganjuk"),
        //   leading: Image.asset("assets/images/logo-app.png"),
        // ),
        body: SafeArea(child: DashboardController.to.currentPage),
        // Container(
        //   color: Colors.white10,
        //   child: SingleChildScrollView(
        //     child: Column(children: <Widget>[
        //       Container(
        //         width: Get.width,
        //         height: Get.height / 4,
        //         color: Colors.green,
        //       ),
        //       SizedBox(height: 40),
        //       Padding(
        //         padding: const EdgeInsets.all(8.0),
        //         child: Row(
        //           children: <Widget>[
        //             MenuItem(
        //               title: 'Home Visite',
        //               url: '/homevisite',
        //               image: 'assets/images/logo-app.png',
        //               round: 20,
        //             ),
        //             MenuItem(
        //               title: 'Jadwal Dokter',
        //               url: '/jadwalDokter',
        //               image: 'assets/images/logo-app.png',
        //               round: 20,
        //             ),
        //             MenuItem(
        //               title: 'Kamar',
        //               url: '/kamar',
        //               image: 'assets/images/logo-app.png',
        //               round: 20,
        //             ),
        //           ],
        //         ),
        //       ),
        //       SizedBox(height: 50),
        //       Container(
        //         width: 350,
        //         height: 250.0,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(20),
        //           ),
        //           boxShadow: [
        //             BoxShadow(
        //               blurRadius: 5,
        //               offset: Offset(2, 3),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ]),
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: DashboardController.to.selectedTabIndex.value,
          onTap: DashboardController.to.navBarTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
