import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h_10 = const SizedBox(height: 10,);
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: (){
              Get.back();
            },
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("assets/phone_icon.png", height: 80,),
                h_10,
                const Text("Enter your primary phone number to register"),
                h_10,
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
                              const Text("+84")
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
        ),
        bottomNavigationBar: SafeArea(
          child:ElevatedButton(
            onPressed: (){
              Get.toNamed(Routes.PASSWORD);
            },
            child: Text("Continue"),
            style: ElevatedButton.styleFrom(primary: Colors.green),
          ),
        ),
      ),
    );
  }
}
