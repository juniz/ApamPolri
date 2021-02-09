import 'package:cloud_firestore/cloud_firestore.dart';

class Rumkit {
  Rumkit({
    this.nama,
    this.password,
    this.status,
    this.tlp,
    this.urlApi,
    this.username,
  });
  String nama;
  String password;
  bool status;

  int tlp;
  String urlApi;
  String username;

  Rumkit.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    nama = documentSnapshot.data()["nama"];
    password = documentSnapshot.data()["password"];
    status = documentSnapshot.data()["status"];
    tlp = documentSnapshot.data()["tlp"];
    urlApi = documentSnapshot.data()["urlApi"];
    username = documentSnapshot.data()["username"];
  }
}
