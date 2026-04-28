import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var firstname = "".obs;
  var secondname = "".obs;
  var email = "".obs;
  var phone = "".obs;
  var gender = "".obs;
  var dob = "".obs;
  var profileUrl = "".obs;

  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController profileUrlController = TextEditingController();

  var isEditingPhone = false.obs;
  var isEditingGender = false.obs;
  var isEditingDob = false.obs;
  var isEditingProfile = false.obs;

  var isLoading = false.obs;

  Future<void> fetchProfile() async {
    final userId = GetStorage().read("userId");

    try {
      isLoading(true);

      var response = await http.get(
        Uri.parse("http://10.7.16.252/rootFolder/profile.php?id=$userId"),
      );

      var data = jsonDecode(response.body);

      if (data["status"] == "success") {
        var user = data["user"];

        firstname.value = user["firstname"] ?? "";
        secondname.value = user["secondname"] ?? "";
        email.value = user["emailaddress"] ?? "";
        phone.value = user["phone"] ?? "";
        gender.value = user["gender"] ?? "";
        dob.value = user["date_of_birth"] ?? "";
        profileUrl.value = user["profile_url"] ?? "";
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateProfile() async {
    final userId = GetStorage().read("userId");

    var response = await http.post(
      Uri.parse("http://10.7.16.252/rootFolder/updateprofile.php"),
      body: {
        "id": userId.toString(),
        "phone": phoneController.text.isEmpty
            ? phone.value
            : phoneController.text,
        "gender": genderController.text.isEmpty
            ? gender.value
            : genderController.text,
        "dob": dobController.text.isEmpty ? dob.value : dobController.text,
      },
    );

    var data = jsonDecode(response.body);

    if (data["status"] == "success") {
      if (phoneController.text.isNotEmpty) {
        phone.value = phoneController.text;
      }
      if (genderController.text.isNotEmpty) {
        gender.value = genderController.text;
      }
      if (dobController.text.isNotEmpty) {
        dob.value = dobController.text;
      }

      Get.snackbar("Success", "Profile updated");
    } else {
      Get.snackbar("Error", data["message"]);
    }
  }

  void logout() {
    GetStorage().remove("userId");
    Get.offAllNamed("/login");
  }
}
