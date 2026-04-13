import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/configs/routes.dart';
import 'package:flutter_application_1/controllers/cartcontroller.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  CartContoller cartContoller = Get.put(CartContoller());

  runApp(
    GetMaterialApp(
      initialRoute: "/",
      getPages: routes,
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    ),
  );
}
