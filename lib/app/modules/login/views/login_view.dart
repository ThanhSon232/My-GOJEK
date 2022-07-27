import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const h_20 = SizedBox(height: 20,);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.grey,
          ),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/login_icon.png", height: 80,),
            h_20,
            Text("Enter your registered phone number to log in", style: textTheme.headline1,),
            h_20,
            Row(
              children: [
                SizedBox(
                  width: 85,
                  height: 30,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/flag.png",
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("+84", style: textTheme.headline3,)
                        ],
                      )),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: TextFormField(
                    onSaved: (value) {
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                        hintText: '123xxxxxxx'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.PASSWORD_LOGIN);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
            child: const Padding(
              padding: EdgeInsets.all(15),
              child: Text("Confirm"),
            ),
          ),
        ),
      ),    );
  }
}
