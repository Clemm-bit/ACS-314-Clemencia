import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Login Screen",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/arianagrande.jpg', height: 150, width: 200),
            Text("Login Screen"),
            SizedBox(height: 30),
            Text("Enter Username"),
            TextField(),
            Text("Enter Password"),
            TextField(),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    ),
  );
}
