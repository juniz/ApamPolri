import 'package:apam/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:apam/widget/awesome_dialog_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put((ProfileController()));
    return Container(
      color: Colors.white70,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
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
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 15),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              profileController.profil.value.noRkmMedis,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          leading: Icon(Icons.account_box_outlined),
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
                              profileController.profil.value.nmPasien,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          leading: Icon(Icons.person),
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
                                  .format(
                                      profileController.profil.value.tglLahir)
                                  .toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                          ),
                          leading: Icon(Icons.calendar_today),
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
                                profileController.profil.value.alamat,
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
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.5,
              child: RaisedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.WARNING,
                    headerAnimationLoop: false,
                    animType: AnimType.TOPSLIDE,
                    title: 'Log Out',
                    desc: 'Apakah Anda Yakin ?',
                    btnCancelOnPress: () {},
                    btnOkOnPress: () {
                      profileController.logout();
                    },
                  ).show();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                color: Colors.red,
                disabledColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
