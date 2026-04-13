import 'package:flutter_application_1/models/productsmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartContoller extends GetxController {
  var cartItems = <Products>[].obs;

  void addToCart(Products product) {
    cartItems.add(product);
  }

  void removeFromCart(Products product) {
    cartItems.remove(product);
  }
}
