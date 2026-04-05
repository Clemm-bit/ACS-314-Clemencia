import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
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
          if (index == 0) {
            Get.toNamed("/dashboard");
            //Navigator.pushReplacementNamed(context,"/dashboard" ); //Handle button tap
          } else if (index == 1) {
            Get.toNamed("/categories");
            //Navigator.pushReplacementNamed(context, "/categories");
          } else if (index == 2) {
            Get.toNamed("/orders");
            //Navigator.pushReplacementNamed(context, "/orders");
          } else if (index == 3) {
            Get.toNamed("/profile");
            //Navigator.pushReplacementNamed(context, "/profile");
          } else if (index == 4) {
            Get.toNamed("/cart");
            //Navigator.pushReplacementNamed(context, "/carts");
          }
        },
      ),
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage("electronics.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      "Electronics",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed("/shoes");
                    },
                    child: Container(
                      height: 400.0,
                      width: 400.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.black, width: 2.0),
                        image: DecorationImage(
                          image: AssetImage("shoes.webp"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Text(
                        "Shoes",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage("personalcare.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      "Personal Care",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage("homeandkitchen.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      "Home and Kitchen",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage("furniture.webp"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      "Furniture",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    height: 400.0,
                    width: 400.0,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage("books.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(
                      "Books",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
