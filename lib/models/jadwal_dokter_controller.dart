import 'dart:convert';

import 'package:apam/models/jadwal_praktek.dart';

class DokterController {
  DateTime tgl;
  List<JadwalPraktek> data;
  DokterController({this.tgl, this.data});
}
