import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h_20 = const SizedBox(
      height: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo_gojek.png",
          height: 100,
          width: 100,
        ),
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/banner.png"),
                SizedBox(height: Get.height * 0.1),
                const Text("Hi, Driver-partner! Ready to hit the road?"),
                h_20,
                const Text("Let's login to start receiving orders!"),
                h_20,
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          // Get.toNamed(Routes.LOGIN);
                        },
                        child: const Text("Log in"))),
                h_20,
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: const Text("REGISTER AS DRIVER-PARTNER"))),
                h_20,
                const Text(
                    "Click on Register to start or continue signing up, and view your registration status"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
