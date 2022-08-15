import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api_handler.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  var isLoading = false.obs;
  var error = ''.obs;
  APIHandlerImp apiHandlerImp = APIHandlerImp();


  String? phoneNumberValidator(String value) {
    if(value.isEmpty){
      return "This field must be filled";
    } else if(!value.isPhoneNumber){
      return "You must enter a right phone number";
    }
    return null;
  }

  Future<bool> validateAndSave() async{
    isLoading.value = true;
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      isLoading.value = false;
      return false;
    }
    await apiHandlerImp.deleteToken();


    var phoneResponse = await apiHandlerImp.post({
      "phoneNumber": '0${phoneNumberController.text}'
    },
        "driver/checkPhoneNumber");

    if(phoneResponse.data["status"]){
      error.value = "Phone number is existed, try another one";
      isLoading.value = false;
      return false;
    }
    formKey.currentState!.save();
    isLoading.value = false;
    return true;
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



}
