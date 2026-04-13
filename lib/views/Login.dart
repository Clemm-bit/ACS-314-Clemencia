import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/logincontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

Logincontroller logincontroller = Get.put(Logincontroller());
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text(
      //     "Login Screen",
      //     style: TextStyle(fontSize: 20, color: Colors.white),
      //   ),
      //   backgroundColor: Colors.amberAccent,
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/jumialogo.jpg', height: 150, width: 200),
              // Text(
              //   "Login Screen",
              //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              // ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Username",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Use email",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Password",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => TextField(
                  obscureText: !logincontroller.isPasswordVisible.value,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "sister",
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        logincontroller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onTap: () {
                        logincontroller.togglePassword();
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              //
              GestureDetector(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                onTap: () async {
                  if (usernameController.text.isEmpty) {
                    Get.snackbar("Error", "Enter email address");
                  } else if (passwordController.text.isEmpty) {
                    Get.snackbar("Error", "Enter password");
                  } else {
                    final response = await http.get(
                      Uri.parse(
                        "http://10.7.21.26/rootFolder/login.php?emailaddress=${usernameController.text}&password=${passwordController.text}",
                      ),
                    );
                    if (response.statusCode == 200) {
                      final serverData = jsonDecode(response.body);
                      if (serverData['code'] == 1) {
                        String emailaddress =
                            serverData["userdetails"][0]["emailaddress"];
                        print(emailaddress); //stored in shared pref
                        Get.toNamed("/homescreen");
                      } else {
                        Get.snackbar("Error", serverData["message"]);
                      }
                    } else {
                      Get.snackbar(
                        "Server error",
                        "Error occurred when logging in",
                      );
                    }
                  }
                  // bool success = logincontroller.login(
                  //   usernameController.text,
                  //   passwordController.text,
                  // );
                  // if (success) {
                  //   Get.offAndToNamed("/homescreen");
                  // } else {
                  //   Get.snackbar(
                  //     "Login Failed",
                  //     "Invalid username or password",
                  //     snackPosition: SnackPosition.BOTTOM,
                  //   );
                  // }
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                child: Row(
                  children: [
                    Text("Don't have an account"),
                    SizedBox(width: 5),
                    GestureDetector(
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: primaryColor),
                      ),
                      onTap: () {
                        Get.toNamed("/signup");
                      },
                    ),
                    Spacer(),
                    Text("Forgot Password?"),
                    SizedBox(width: 5),
                    Text("Reset", style: TextStyle(color: primaryColor)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
