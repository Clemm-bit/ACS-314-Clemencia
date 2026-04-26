import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_application_1/models/productsmodel.dart';

class CartController extends GetxController {
  var cartItems = <Products>[].obs;

  var isLoading = false.obs;

  var totalPrice = 0.obs;

  Future<void> fetchCart(String userId) async {
    try {
      isLoading(true);

      var url = Uri.parse(
        "http://10.7.24.12/rootFolder/getcart.php?id=$userId",
      );

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        if (data["status"] == "success") {
          List products = data["cart"];

          cartItems.clear();
          totalPrice.value = 0;

          for (var item in products) {
            Products product = Products(
              id: item["product_id"],
              cart_id: item["cart_id"],
              name: item["product_name"],
              desc: item["description"],
              price: item["price"].toString(),
              image: item["image_url"],
              quantity: item["quantity"].toString(),
              categories_id: '',
            );

            cartItems.add(product);

            totalPrice.value +=
                int.parse(item["price"].toString()) *
                int.parse(item["quantity"].toString());
          }
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> addToCartAPI(String userId, String productId) async {
    try {
      var url = Uri.parse("http://10.7.24.12/rootFolder/addtocart.php");

      var response = await http.post(
        url,
        body: {"id": userId, "product_id": productId},
      );

      var data = jsonDecode(response.body);

      if (data["status"] == "inserted" || data["status"] == "updated") {
        await fetchCart(userId);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> removeFromCartAPI(String userId, String cartId) async {
    try {
      var url = Uri.parse("http://10.7.24.12/rootFolder/removefromcart.php");

      var response = await http.post(url, body: {"cart_id": cartId});

      var data = jsonDecode(response.body);

      if (data["status"] == "decreased" || data["status"] == "removed") {
        await fetchCart(userId);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void clearCart() {
    cartItems.clear();
    totalPrice.value = 0;
  }
}
