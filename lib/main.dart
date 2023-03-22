import 'package:fashontonic/screens/cart.dart';
import 'package:fashontonic/screens/nav.dart';
import 'package:fashontonic/state/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  Get.put(Controller());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      home: Nav(),
      routes: {
        "/cart": (context) => const Cart(),
      },
    ),
  );
}
