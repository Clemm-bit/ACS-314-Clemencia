import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
        //       Get.toNamed("/carts");
        //       //Navigator.pushReplacementNamed(context, "/profile");
        //     } else if (index == 4) {
        //       Get.toNamed("/porfile");
        //       //Navigator.pushReplacementNamed(context, "/carts");
        //     }
        //   },
        // ),
        appBar: AppBar(
          title: Text(
            "My Orders",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          bottom: TabBar(
            indicatorColor: searchBarColor,
            tabs: [
              Tab(text: "to be shipped"),
              Tab(text: "shipped"),
              Tab(text: "completed"),
              Tab(text: "cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [Container(), Container(), Container(), Container()],
        ),
      ),
    );
  }
}
