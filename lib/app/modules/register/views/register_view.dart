import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                Text("Enter your primary phone number to register", style: textTheme.headline1,),
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
                              Text("+84", style: textTheme.headline3,)
                            ],
                          )),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Obx(() => Form(
                        key: controller.formKey,
                        child: Flexible(
                          child: TextFormField(
                            controller: controller.phoneNumberController,
                            validator: (value) => controller.phoneNumberValidator(value!),
                            onSaved: (value) {
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration:  InputDecoration(
                                hintText: '123xxxxxxx',
                              errorText: controller.error.value

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ElevatedButton(
            onPressed: () async{
              var check =  await controller.validateAndSave();

              if(check){
                Get.toNamed(Routes.OTP);
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child:  Obx(()=> Padding(padding: const EdgeInsets.symmetric(vertical: 20), child: controller.isLoading.value ? const CircularProgressIndicator(color: Colors.white,) : const Text("Continue"),)),
          ),
        ),
      ),
    );
  }
}
