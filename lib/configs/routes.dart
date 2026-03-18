import 'package:flutter_application_1/views/cart.dart';
import 'package:flutter_application_1/views/categories.dart';
import 'package:flutter_application_1/views/dashboard.dart';
import 'package:flutter_application_1/views/homescreen.dart';
import 'package:flutter_application_1/views/login.dart';
import 'package:flutter_application_1/views/orders.dart';
import 'package:flutter_application_1/views/profile.dart';
import 'package:flutter_application_1/views/signup.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

var routes = [
  GetPage(name: "/", page: () => LoginScreen()),
  GetPage(name: "/signup", page: () => SignUpScreen()),
  GetPage(name: "/homescreen", page: () => HomeScreen()),
  GetPage(name: "/dashboard", page: () => DashBoard()),
  GetPage(name: "/cart", page: () => CartsScreen()),
  GetPage(name: "/profile", page: () => ProfileScreen()),
  GetPage(name: "/categories", page: () => CategoriesScreen()),
  GetPage(name: "/orders", page: () => OrdersScreen()),
];
