import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        backgroundColor: primaryColor,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Welcome Clemencia!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              child: Text(
                "clemencianyaboke33@gmail.com",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                radius: 62.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("clemprofile.jpg"),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            children: [
              Text("Clemencia Nyaboke"),
              SizedBox(width: 8.0),
              Icon(Icons.edit, size: 20),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Phone number",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            children: [
              Text("0794415261"),
              SizedBox(width: 8.0),
              Icon(Icons.edit, size: 20),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Email Adress",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            children: [
              Text("Clemencianyaboke33@gmail.com"),
              SizedBox(width: 8.0),
              Icon(Icons.edit, size: 20),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Gender",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            children: [
              Text("Female"),
              SizedBox(width: 8.0),
              Icon(Icons.edit, size: 20),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Date of Birth",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ],
          ),
          Row(
            children: [
              Text("25-10-2005"),
              SizedBox(width: 8.0),
              Icon(Icons.edit, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
