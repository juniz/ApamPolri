import 'dart:convert';

import 'package:apam/models/jadwal_praktek.dart';

class DokterController {
  DateTime tgl;
  List<JadwalPraktekList> data;
  DokterController({this.tgl, this.data});
}
