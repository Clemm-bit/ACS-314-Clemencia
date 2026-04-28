import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

TextEditingController firstnameContoller = TextEditingController();
TextEditingController secondnameController = TextEditingController();
TextEditingController emailaddressController = TextEditingController();
TextEditingController phonenumberController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmpasswordController = TextEditingController();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("jumialogo.jpg", height: 150, width: 150),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Enter first name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Enter second name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: firstnameContoller,
                      decoration: InputDecoration(
                        hintText: "first name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: secondnameController,
                      decoration: InputDecoration(
                        hintText: "second name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Enter email address",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: emailaddressController,
                decoration: InputDecoration(
                  hintText: "example@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Enter phone number",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              TextField(
                controller: phonenumberController,
                decoration: InputDecoration(
                  hintText: "07xxxxxxxx",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Enter password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Text(
                        "Confirm password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: confirmpasswordController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Checkbox(value: false, onChanged: null),
                  Text("Accept terms and conditions"),
                ],
              ),
              SizedBox(height: 30.0),
              GestureDetector(
                onTap: () async {
                  if (firstnameContoller.text.isEmpty) {
                    Get.snackbar("Error", "please enter first name");
                  } else if (secondnameController.text.isEmpty) {
                    Get.snackbar("Error", "please enter second name");
                  } else if (emailaddressController.text.isEmpty) {
                    Get.snackbar("Erro", "Please enter email address");
                  } else if (phonenumberController.text.isEmpty) {
                    Get.snackbar("Errro", "Please enter phone number");
                  } else if (passwordController.text.isEmpty ||
                      confirmpasswordController.text.isEmpty ||
                      passwordController.text.toString().compareTo(
                            confirmpasswordController.text,
                          ) !=
                          0) {
                    Get.snackbar(
                      "error",
                      "password and confrim password should be empty and marching",
                    );
                  } else {
                    try {
                      final response = await http.get(
                        Uri.parse(
                          "http://10.7.16.252/rootFolder/create.php?firstname=${firstnameContoller.text}&secondname=${secondnameController.text}&emailaddress=${emailaddressController.text}&password=${passwordController.text}",
                        ),
                      );
                      if (response.statusCode == 200) {
                        final serverData = jsonDecode(response.body);
                        if (serverData["success"] == 1) {
                          Get.snackbar(
                            "Success",
                            "you have successfully created an account",
                          );
                          Get.offAndToNamed("/");
                        }
                      } else {
                        Get.snackbar("Sign Up", "sign up not successful");
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  }
                  ;
                },
                child: Container(
                  height: 50.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Row(
                  children: [
                    Text("Already have an account?"),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      child: Text(
                        "Login",
                        style: TextStyle(color: primaryColor),
                      ),
                      onTap: () {
                        Get.toNamed("/");
                      },
                    ),
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
