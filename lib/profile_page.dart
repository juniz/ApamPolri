import 'package:apam/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put((ProfileController()));
    return Container(
      color: Colors.white10,
      child: Stack(
        children: <Widget>[
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.green,
          ),
          Positioned(
            left: 23,
            bottom: 50,
            child: Container(
              width: 350,
              height: Get.height / 1.8,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Obx(() {
                  if (profileController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else
                    return Column(
                      children: [
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'NRP :',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              profileController.profileList.value.nrp,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          leading: Icon(Icons.account_box_outlined),
                        ),
                        Divider(
                          color: Colors.black54,
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Nama :',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              profileController.profileList.value.nama,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          leading: Icon(Icons.person),
                        ),
                        Divider(
                          color: Colors.black54,
                        ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Tanggal Lahir :',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(profileController
                                      .profileList.value.tglLahir)
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          leading: Icon(Icons.calendar_today),
                        ),
                        Divider(
                          color: Colors.black54,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            title: Text(
                              'Alamat :',
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                profileController.profileList.value.alamat,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                            ),
                            leading: Icon(Icons.home),
                          ),
                        ),
                      ],
                    );
                }),
              ),
            ),
          ),
          Positioned(
            left: 130,
            top: 150,
            child: Material(
              shape: CircleBorder(),
              elevation: 18,
              child: Obx(
                () {
                  if (profileController.profileList.value.jk == "Pria")
                    return CircleAvatar(
                      maxRadius: 70,
                      backgroundImage: AssetImage('assets/images/L.png'),
                    );
                  else
                    return CircleAvatar(
                      maxRadius: 70,
                      backgroundImage: AssetImage('assets/images/P.png'),
                    );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
