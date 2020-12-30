import 'package:apam/controller/kamar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KamarPage extends StatelessWidget {
  final KamarController kamarController = Get.put((KamarController()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ketersediaan Kamar"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Obx(
                () {
                  if (kamarController.isLoading.value)
                    return Center(child: CircularProgressIndicator());
                  else {
                    return ListView.separated(
                      itemCount: kamarController.kamarList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.home_filled),
                          title: Text(
                            '${kamarController.kamarList[index].kelas}\nTersedia : ${kamarController.kamarList[index].kosong}',
                            style: TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                              'Kapasitas : ${kamarController.kamarList[index].total}'),
                          onTap: () async {},
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
