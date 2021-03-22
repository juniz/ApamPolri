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
      width: Get.width,
      height: Get.height,
      color: Colors.white70,
      child: Obx(() {
        if (profileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    maxRadius: 70,
                    backgroundImage: profileController.profil.value.jk == 'P'
                        ? AssetImage('assets/images/P.png')
                        : AssetImage('assets/images/L.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.account_box),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  'NRP : ${profileController.profil.value.nrp}'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.person),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  'Nama : ${profileController.profil.value.nama}'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.person_rounded),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  'Jenis Kelamin : ${profileController.profil.value.jk == 'P' ? 'Wanita' : 'Pria'}'),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20.0, right: 20),
                    //   child: Card(
                    //     color: Colors.white,
                    //     child: Row(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.all(10.0),
                    //           child: Icon(Icons.event_available),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 20.0),
                    //           child: Text(
                    //               'Tanggal Lahir : ${DateFormat('dd-MM-yyyy').format(profileController.profil.value.tglLahir).toString()}'),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.pin_drop),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  'Alamat : ${profileController.profil.value.email}'),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Card(
                        color: Colors.white,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.local_post_office),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                  'Satuan : ${profileController.profil.value.satuan}'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Expanded(
                flex: 1,
                child: Container(
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
                        btnOkOnPress: () async {
                          await profileController.logout();
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
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          );
          // else if (profileController.isGoogle.value == true) {
          //   return Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         flex: 4,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 20.0),
          //           child: CircleAvatar(
          //             maxRadius: 70,
          //             backgroundImage:
          //                 NetworkImage(profileController.photoURL.value),
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       ),
          //       Expanded(
          //         flex: 10,
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.only(left: 20.0, right: 20),
          //               child: Card(
          //                 color: Colors.white,
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Icon(Icons.account_box),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 20.0),
          //                       child: Text(
          //                           'NRP : ${profileController.doc.value.nrp}'),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 20.0, right: 20),
          //               child: Card(
          //                 color: Colors.white,
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Icon(Icons.account_box),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 20.0),
          //                       child: Text(
          //                           'KTP : ${profileController.doc.value.ktp}'),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 20.0, right: 20),
          //               child: Card(
          //                 color: Colors.white,
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Icon(Icons.person),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 20.0),
          //                       child: Text(
          //                           'Nama : ${profileController.doc.value.nama}'),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 20.0, right: 20),
          //               child: Card(
          //                 color: Colors.white,
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Icon(Icons.home_work),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 20.0),
          //                       child: Text(
          //                           'Kesatuan : ${profileController.doc.value.satuan}'),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //             // Padding(
          //             //   padding: const EdgeInsets.only(left: 20.0, right: 20),
          //             //   child: Card(
          //             //     color: Colors.white,
          //             //     child: Row(
          //             //       children: [
          //             //         Padding(
          //             //           padding: const EdgeInsets.all(10.0),
          //             //           child: Icon(Icons.event_available),
          //             //         ),
          //             //         Padding(
          //             //           padding: const EdgeInsets.only(left: 20.0),
          //             //           child: Text(
          //             //               'Tanggal Lahir : ${DateFormat('dd-MM-yyyy').format(profileController.profil.value.tglLahir).toString()}'),
          //             //         )
          //             //       ],
          //             //     ),
          //             //   ),
          //             // ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 20.0, right: 20),
          //               child: Card(
          //                 color: Colors.white,
          //                 child: Row(
          //                   children: [
          //                     Padding(
          //                       padding: const EdgeInsets.all(10.0),
          //                       child: Icon(Icons.mail),
          //                     ),
          //                     Padding(
          //                       padding: const EdgeInsets.only(left: 20.0),
          //                       child: Text(
          //                           'Email : ${profileController.doc.value.email}'),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //       // SizedBox(
          //       //   height: 10,
          //       // ),
          //       Expanded(
          //         flex: 1,
          //         child: Container(
          //           width: Get.width * 0.5,
          //           child: RaisedButton(
          //             onPressed: () {
          //               AwesomeDialog(
          //                 context: context,
          //                 dialogType: DialogType.WARNING,
          //                 headerAnimationLoop: false,
          //                 animType: AnimType.TOPSLIDE,
          //                 title: 'Log Out',
          //                 desc: 'Apakah Anda Yakin ?',
          //                 btnCancelOnPress: () {},
          //                 btnOkOnPress: () async {
          //                   await profileController.logout();
          //                 },
          //               ).show();
          //             },
          //             shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(18.0),
          //             ),
          //             child: Text(
          //               'Log Out',
          //               style: TextStyle(
          //                   fontWeight: FontWeight.bold, color: Colors.white),
          //             ),
          //             color: Colors.red,
          //             disabledColor: Colors.red,
          //           ),
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       )
          //     ],
          //   );
          // }
        }
      }),
    );
  }
}
