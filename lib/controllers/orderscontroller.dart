import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class OrdersController extends GetxController {
  var orders = [].obs;
  var isLoading = false.obs;

  Future<void> fetchOrders() async {
    final userId = GetStorage().read("userId");

    try {
      isLoading(true);

      var response = await http.get(
        Uri.parse("http://10.7.16.252/rootFolder/getorders.php?id=$userId"),
      );

      var data = jsonDecode(response.body);

      if (data["status"] == "success") {
        orders.value = data["orders"];
      } else {
        Get.snackbar("Error", data["message"]);
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
