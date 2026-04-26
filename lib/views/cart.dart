import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/cartcontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart';

class CartsScreen extends StatefulWidget {
  const CartsScreen({super.key});

  @override
  State<CartsScreen> createState() => _CartsScreenState();
}

class _CartsScreenState extends State<CartsScreen> {
  final CartController cartController = Get.find();
  final box = GetStorage();
  late final String userId = box.read("userId");

  @override
  void initState() {
    super.initState();
    cartController.fetchCart(userId);
  }

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
      body: Obx(() {
        if (cartController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (cartController.cartItems.isEmpty) {
          return Column(
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
                  Get.toNamed("/categories");
                },
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];

                    return ListTile(
                      leading: Image.network(
                        // ignore: prefer_interpolation_to_compose_strings
                        "http://10.7.24.12/rootFolder/Image.php?image=" +
                            item.image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image);
                        },
                      ),

                      title: Text(
                        item.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.desc),
                          SizedBox(height: 5),
                          Text(
                            "quantity: ${item.quantity}",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  cartController.removeFromCartAPI(
                                    userId,
                                    item.cart_id,
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  cartController.addToCartAPI(userId, item.id);
                                },
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              cartController.removeFromCartAPI(
                                userId,
                                item.cart_id,
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 200,
                              alignment: Alignment.center,
                              color: primaryColor,
                              child: Text(
                                "remove from cart",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      trailing: Text(
                        "Ksh ${item.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: Colors.grey)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Ksh ${cartController.totalPrice.value}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    GestureDetector(
                      onTap: () {
                        Get.toNamed("/orders");
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Proceed to Checkout",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }
}
