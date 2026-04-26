import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/colors.dart';
import 'package:flutter_application_1/controllers/profilecontroller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final controller = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    controller.fetchProfile();
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
        backgroundColor: primaryColor,
        title: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "hello ${controller.firstname.value}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                child: Text(
                  controller.email.value,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 62.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: controller.profileUrl.value.isNotEmpty
                          ? NetworkImage(
                              "http://10.7.24.12/rootFolder/Image.php?image=${controller.profileUrl.value}",
                            )
                          : AssetImage("assets/default.png") as ImageProvider,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "${controller.firstname.value} ${controller.secondname.value}",
                  ),
                  SizedBox(width: 8.0),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Phone number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: controller.isEditingPhone.value
                          ? TextField(
                              controller: controller.phoneController,
                              decoration: InputDecoration(
                                hintText: "Enter phone number",
                              ),
                            )
                          : Text(controller.phone.value),
                    ),

                    IconButton(
                      icon: Icon(
                        controller.isEditingPhone.value
                            ? Icons.check
                            : Icons.edit,
                      ),
                      onPressed: () async {
                        if (controller.isEditingPhone.value) {
                          await controller.updateProfile();
                        } else {
                          // Put current value into TextField
                          controller.phoneController.text =
                              controller.phone.value;
                        }

                        controller.isEditingPhone.toggle();
                      },
                    ),
                  ],
                );
              }),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email Adress",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                children: [Text(controller.email.value), SizedBox(width: 8.0)],
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: controller.isEditingGender.value
                          ? TextField(
                              controller: controller.genderController,
                              decoration: InputDecoration(hintText: "gender"),
                            )
                          : Text(controller.gender.value),
                    ),
                    IconButton(
                      icon: Icon(
                        controller.isEditingGender.value
                            ? Icons.check
                            : Icons.edit,
                      ),
                      onPressed: () async {
                        if (controller.isEditingGender.value) {
                          await controller.updateProfile();
                        } else {
                          controller.genderController.text =
                              controller.gender.value;
                        }
                        controller.isEditingGender.toggle();
                      },
                    ),
                  ],
                );
              }),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Date of Birth",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Obx(() {
                return Row(
                  children: [
                    Expanded(
                      child: controller.isEditingDob.value
                          ? TextField(
                              controller: controller.dobController,
                              decoration: InputDecoration(
                                hintText: "Enter date of birth",
                              ),
                            )
                          : Text(controller.dob.value),
                    ),
                    IconButton(
                      icon: Icon(
                        controller.isEditingDob.value
                            ? Icons.check
                            : Icons.edit,
                      ),
                      onPressed: () async {
                        if (controller.isEditingDob.value) {
                          await controller.updateProfile();
                        } else {
                          controller.dobController.text = controller.dob.value;
                        }
                        controller.isEditingDob.toggle();
                      },
                    ),
                  ],
                );
              }),
            ],
          ),
        );
      }),
    );
  }
}
