import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.white,
      //   color: primaryColor,
      //   buttonBackgroundColor: secondaryColor,
      //   items: <Widget>[
      //     Icon(Icons.dashboard, size: 30),
      //     Icon(Icons.category, size: 30),
      //     Icon(Icons.list, size: 30),
      //     Icon(Icons.person, size: 30),
      //     Icon(Icons.shopping_cart, size: 30),
      //   ],
      //   onTap: (index) {
      //     if (index == 0) {
      //       Get.toNamed("/dashboard");
      //       //Navigator.pushReplacementNamed(context,"/dashboard"); //Handle button tap
      //     } else if (index == 1) {
      //       Get.toNamed("/categories");
      //       //Navigator.pushReplacementNamed(context, "/categories");
      //     } else if (index == 2) {
      //       Get.toNamed("/orders");
      //       //Navigator.pushReplacementNamed(context, "/orders");
      //     } else if (index == 3) {
      //       Get.toNamed("/profile");
      //       //Navigator.pushReplacementNamed(context, "/profile");
      //     } else if (index == 4) {
      //       Get.toNamed("/cart");
      //       //Navigator.pushReplacementNamed(context, "/carts");
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: searchBarColor,
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search for product here",
            ),
          ),
        ),
      ),
    );
  }
}
