import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilFirebase {
  ProfilFirebase({
    this.docId,
    this.email,
    this.idEmail,
    this.ktp,
    this.nama,
    this.nrp,
    this.satuan,
  });
  String docId;
  String email;
  String idEmail;
  String ktp;
  String nama;
  String nrp;
  String satuan;

  ProfilFirebase.fromDocumentSnapshot(
    DocumentSnapshot documentSnapshot,
  ) {
    docId = documentSnapshot.data()["docId"];
    email = documentSnapshot.data()["email"];
    idEmail = documentSnapshot.data()["idEmail"];
    ktp = documentSnapshot.data()["ktp"];
    nama = documentSnapshot.data()["nama"];
    nrp = documentSnapshot.data()["nrp"];
    satuan = documentSnapshot.data()["satuan"];
  }
}
