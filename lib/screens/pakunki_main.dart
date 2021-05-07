import 'package:flutter/material.dart';
import 'package:phone_auth_project/screens/packages_list.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(Pakunki());
}

class Pakunki extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pakunki App',
      theme: ThemeData(
        // primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Packagelist(),
    );
  }
}
