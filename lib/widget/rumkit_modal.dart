import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

modalApi() async {
  // await _loginController.apiRumkit();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference rumkit = firestore.collection('rumkit');
  return Get.bottomSheet(
    Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: rumkit.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData)
                    return Container(
                      child: ListView.separated(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.home),
                            title: Text(
                              snapshot.data.docs[index].data()['nama'],
                              style: TextStyle(color: Colors.black),
                            ),
                            onTap: () async {
                              // _loginController.rumkitController.text =
                              //     snapshot.data.docs[index].data()['nama'];
                              // await _loginController.selectedRumkit(
                              //     snapshot.data.docs[index].data()['urlApi'],
                              //     snapshot.data.docs[index]
                              //         .data()['username'],
                              //     snapshot.data.docs[index]
                              //         .data()['password']);
                              Get.back();
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    );
                  else
                    return Center(
                      child: Text('Loading.......'),
                    );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
