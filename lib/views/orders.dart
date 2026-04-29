import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/orderscontroller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final controller = Get.put(OrdersController());
  @override
  void initState() {
    super.initState();
    controller.fetchOrders();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
        //       Get.toNamed("/carts");
        //       //Navigator.pushReplacementNamed(context, "/profile");
        //     } else if (index == 4) {
        //       Get.toNamed("/porfile");
        //       //Navigator.pushReplacementNamed(context, "/carts");
        //     }
        //   },
        // ),
        appBar: AppBar(
          title: Text(
            "My Orders",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          bottom: TabBar(
            indicatorColor: searchBarColor,
            tabs: [
              Tab(text: "to be shipped"),
              Tab(text: "shipped"),
              Tab(text: "completed"),
              Tab(text: "cancelled"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (controller.orders.isEmpty) {
                return Center(child: Text("No orders found"));
              }

              return ListView.builder(
                itemCount: controller.orders.length,
                itemBuilder: (context, index) {
                  var order = controller.orders[index];
                  var items = (order['items'] is List) ? order['items'] : [];

                  return Card(
                    child: Column(
                      children: [
                        Text("Order ID: ${order['orders_id']}"),
                        Text("Total: ${order['total_amount']}"),

                        Column(
                          children: List.generate(items.length, (i) {
                            var item = items[i];

                            return ListTile(
                              leading: Image.network(
                                "http://10.7.16.252/rootFolder/Image.php?image=${item['image_url']}",
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                item['product_name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              subtitle: Text("Qty: ${item['quantity']}"),
                              trailing: Text("Ksh ${item['price']}"),
                            );
                          }),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
