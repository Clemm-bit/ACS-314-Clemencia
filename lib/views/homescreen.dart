import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/homescreencontroller.dart';
import 'package:flutter_application_1/views/cart.dart';
import 'package:flutter_application_1/views/categories.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/orders.dart';
import 'package:flutter_application_1/views/profile.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

var myscreens = [
  DashBoard(),
  CategoriesScreen(),
  OrdersScreen(),
  ProfileScreen(),
  CartsScreen(),
];
HomescreenController homescreenController = Get.put(HomescreenController());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          index: homescreenController.selectedScreen.value,
          backgroundColor: Colors.white,
          color: primaryColor,
          buttonBackgroundColor: secondaryColor,
          items: <Widget>[
            Icon(Icons.dashboard, size: 30),
            Icon(Icons.category, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.person, size: 30),
            Icon(Icons.shopping_cart, size: 30),
          ],
          onTap: (index) {
            homescreenController.updateSelection(index);
            // if (index == 0) {
            //   Get.toNamed("/dashboard");
            //   //Navigator.pushReplacementNamed(context,"/dashboard" ); //Handle button tap
            // } else if (index == 1) {
            //   Get.toNamed("/categories");
            //   //Navigator.pushReplacementNamed(context, "/categories");
            // } else if (index == 2) {
            //   Get.toNamed("/orders");
            //   //Navigator.pushReplacementNamed(context, "/orders");
            // } else if (index == 3) {
            //   Get.toNamed("/profile");
            //   //Navigator.pushReplacementNamed(context, "/profile");
            // } else if (index == 4) {
            //   Get.toNamed("/carts");
            //   //Navigator.pushReplacementNamed(context, "/carts");
            // }
          },
        ),
      ),
      appBar: AppBar(
        title: Container(
          //color: searchBarColor,
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: "Search product by name",
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: searchBarColor,
            ),
          ),
        ),
      ),
      body: Obx(() => myscreens[homescreenController.selectedScreen.value]),
      // Stack(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage("onlineshopping.jpeg"),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
