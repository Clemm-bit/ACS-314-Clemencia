import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/cartcontroller.dart';
import 'package:flutter_application_1/models/productsmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

//CartContoller cartContoller = Get.find();
var myproducts = [];
bool loaded = false;

class ProductsCategoriesSCreen extends StatefulWidget {
  final String categories_id = Get.parameters["categories_id"] ?? "";
  final String category_name = Get.parameters["category_name"] ?? "";

  ProductsCategoriesSCreen({super.key});

  @override
  State<ProductsCategoriesSCreen> createState() =>
      _ProductsCategoriesSCreenState();
}

class _ProductsCategoriesSCreenState extends State<ProductsCategoriesSCreen> {
  CartContoller cartContoller = Get.find();

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  fetchProducts() async {
    myproducts.clear();
    var response = await http.get(
      Uri.parse(
        "http://10.7.21.26/rootFolder/products.php?categories_id=${widget.categories_id}",
      ),
    );

    print("Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
    if (response.statusCode == 200) {
      var serverData = jsonDecode(response.body);
      var productData = serverData["data"];
      for (var product in productData) {
        myproducts.add(
          Products(
            name: product["product_name"],
            desc: product["description"],
            image: product["image_url"],
            price: product["price"],
            stock: product["stock"],
            categories_id: product["categories_id"],
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category_name.isEmpty ? "products" : widget.category_name,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
      ),
      body: loaded
          ? ListView.builder(
              itemCount: myproducts.length,
              itemBuilder: (context, index) {
                print("Image from database: '${myproducts[index].image}'");
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
                              myproducts[index].image,
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
                              myproducts[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              myproducts[index].desc,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              myproducts[index].price,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.0),
                            GestureDetector(
                              onTap: () {
                                cartContoller.addToCart(myproducts[index]);
                                Get.toNamed("/cart");
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
