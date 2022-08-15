import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:my_gojek_driver/app/data/model/driver_entity.dart';
import 'package:my_gojek_driver/app/modules/home/controllers/home_controller.dart';

class RequestController extends GetxController {
  //TODO: Implement RequestController

  var homeController = Get.find<HomeController>();
  final count = 5.obs;

  Future<void> handleAccept() async {
    var id = await Get.arguments["key"];
    await FirebaseDatabase.instance
        .ref(
          "MOTORBIKE/${double.parse(homeController.position["latitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/${double.parse(homeController.position["longitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/driverList/${homeController.driverEntity!.driverId}",
        )
        .remove();

    await FirebaseDatabase.instance
        .ref(
            "MOTORBIKE/${double.parse(homeController.position["latitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/${double.parse(homeController.position["longitude"].toString()).toStringAsFixed(2).replaceFirst(".", ",")}/request/$id/driver/${homeController.driverEntity!.driverId}")
        .set({
      "fullname": homeController.driverEntity!.fullname,
      "phone": homeController.driverEntity!.phone,
      "address": homeController.driverEntity!.address,
      "email": homeController.driverEntity!.email,
      "gender": homeController.driverEntity!.gender,
      "vehicleList": [
        {
          "licensePlateNum":
              homeController.driverEntity!.vehicleList!.first.licensePlateNum,
          "typeOfVehicle": "MOTORBIKE",
          "brand": homeController.driverEntity!.vehicleList!.first.brand
        }
      ]
    });
    Get.back(result: "true");
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    while (true) {
      if (count.value == 0) {
        Get.back();
      }
      await Future.delayed(const Duration(seconds: 1)).then((_) {
        count.value -= 1;
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
