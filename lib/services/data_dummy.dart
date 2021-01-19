import 'package:apam/models/rsb_api_model.dart';

class DataDummy {
  static List<DataApi> dummy = <DataApi>[
    DataApi(
        id: 1,
        nama: 'RSB Tk III Nganjuk',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php'),
    DataApi(
        id: 2,
        nama: 'RSB Tk II Kediri',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php'),
    DataApi(
        id: 3,
        nama: 'RSB Tk III Yogyakarta',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php'),
    DataApi(
        id: 4,
        nama: 'RSB Tk III Batu Malang',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php'),
    DataApi(
        id: 5,
        nama: 'RSB Tk III Palangkaraya',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php'),
  ];
}
