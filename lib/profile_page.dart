import 'package:apam/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put((ProfileController()));
    return Container(
      color: Colors.white10,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Obx(() {
              if (profileController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                return Column(
                  children: [
                    Material(
                      shape: CircleBorder(),
                      elevation: 18,
                      child: CircleAvatar(
                        maxRadius: 70,
                        backgroundImage: AssetImage('assets/images/P.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'NRP :',
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          profileController.profil.value.noRkmMedis,
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          profileController.profil.value.nmPasien,
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          DateFormat('dd-MM-yyyy')
                              .format(profileController.profil.value.tglLahir)
                              .toString(),
                          style: TextStyle(color: Colors.black, fontSize: 18),
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
                          style: TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            profileController.profil.value.alamat,
                            style: TextStyle(color: Colors.black, fontSize: 18),
                          ),
                        ),
                        leading: Icon(Icons.home),
                      ),
                    ),
                    Divider(
                      color: Colors.black54,
                    ),
                  ],
                );
            }),
          ),
          RaisedButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: Text(
                    'Apakah Anda Yakin ?',
                  ),
                  content: SizedBox(
                    width: 100,
                    height: 100,
                    child: LottieBuilder.asset(
                        "assets/animation/warning-sign.json"),
                  ),
                  actions: [
                    FlatButton(
                      color: Colors.green,
                      onPressed: () {
                        profileController.logout();
                      },
                      child: Text('Ya'),
                    ),
                    FlatButton(
                      color: Colors.red,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Tidak'),
                    )
                  ],
                  elevation: 20.0,
                ),
              );
            },
            child: Text(
              'Log Out',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            color: Colors.red,
            disabledColor: Colors.red,
          )
        ],
      ),
    );
  }
}
