import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/models/productsmodel.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

var myShoes = [];
bool loaded = false;

// var shoeNames = ["red bottoms", "crocks"];
// var description = ["elegant", "confortable"];
// var price = ["10000", "200"];

class shoesScreen extends StatefulWidget {
  const shoesScreen({super.key});

  @override
  State<shoesScreen> createState() => _shoesScreenState();
}

class _shoesScreenState extends State<shoesScreen> {
  @override
  void initState() {
    fetchShoes();
    super.initState();
  }

  fetchShoes() async {
    var response = await http.get(
      Uri.parse("http://10.7.2.210/rootFolder/products.php?categories_id=2"),
    );

    print("Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var shoeData = serverData["data"];
      for (var shoe in shoeData) {
        myShoes.add(
          Products(
            name: shoe["product_name"],
            desc: shoe["description"],
            image: shoe["image_url"],
            price: shoe["price"],
            stock: shoe["stock"],
            categories_id: shoe["categories_id"],
          ),
        );
      }
      setState(() {
        loaded = true;
      });
    } else {
      Get.snackbar("Error", "server error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? ListView.builder(
            itemCount: myShoes.length,
            itemBuilder: (context, index) {
              print("Image from database: '${myShoes[index].image}'");
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 3.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    children: [
                      // ignore: prefer_interpolation_to_compose_strings
                      Image.network(
                        // ignore: prefer_interpolation_to_compose_strings
                        "http://10.7.21.26/rootFolder/Image.php?image=" +
                            myShoes[index].image,
                        width: 100,
                        height: 100,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, size: 50);
                        },
                      ),
                      SizedBox(width: 20.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            myShoes[index].name,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            myShoes[index].desc,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            myShoes[index].price,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5.0),
                          Container(
                            height: 40,
                            width: 100,
                            alignment: Alignment.center,
                            color: primaryColor,
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        : Center(child: CircularProgressIndicator());
  }
}
