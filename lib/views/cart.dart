import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
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
      //       //Navigator.pushReplacementNamed(context,"/dashboard" ); //Handle button tap
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
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "There are no items in the cart",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(70.0),
              child: Container(
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: primaryColor),
                child: Text(
                  "Go Shopping",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            onTap: () {
              Get.toNamed("/dashboard");
            },
          ),
        ],
      ),
    );
  }
}
