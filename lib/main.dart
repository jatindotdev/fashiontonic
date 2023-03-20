import 'package:fashontonic/screens/home.dart';
import 'package:fashontonic/state/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(Controller());
  runApp(
    GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Home(),
    ),
  );
}
