import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:my_gojek_driver/app/data/api_handler.dart';
import 'package:my_gojek_driver/app/data/model/driver_entity.dart';
import 'package:my_gojek_driver/app/modules/home/controllers/home_controller.dart';

class RequestController extends GetxController {
  //TODO: Implement RequestController

  var homeController = Get.find<HomeController>();
  final count = 10.obs;
  var data = {};
  var isLoading = false.obs;
  APIHandlerImp apiHandlerImp = APIHandlerImp();

  Future<void> handleAccept() async {
    var id = data["requestId"].toString();
    Get.log(id);
    var response = await apiHandlerImp.get("driver/acceptBooking/$id", {});
    print(response);
    Get.back(result: {"answer": true, "path": response.data["data"], "id": data["requestId"].toString()});
  }

  @override
  void onInit() async{
    super.onInit();
    isLoading.value = true;
    data = await Get.arguments["key"];
    isLoading.value = false;
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
