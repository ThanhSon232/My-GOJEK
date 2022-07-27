import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VehicleRegistrationController extends GetxController {
  //TODO: Implement VehicleRegistrationController

  List<String> motorcycleBrand = [
    "Honda",
    "Triumph",
    "Yamaha",
    "Harley – Davidson",
    "Benelli",
    "Kawasaki",
    "Ducati",
    "Suzuki",
    "BMW",
    "Zongshen",
    "SYM",
    "Yadea",
    "Niu",
    "Piaggio",
    "Vinfast",
  ];
  TextEditingController vehicleBrandController = TextEditingController();

  var selectedItem = 0.obs;

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
