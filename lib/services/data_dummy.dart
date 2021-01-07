import 'package:apam/models/rsb_api_model.dart';

class DataDummy {
  static List<DataApi> dummy = <DataApi>[
    DataApi(
        id: 1,
        nama: 'RSB Nganjuk',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php'),
    DataApi(
        id: 2,
        nama: 'RSB Kediri',
        api: 'https://api.rsbhayangkaranganjuk.com/pasien-rest/api.php')
  ];
}
