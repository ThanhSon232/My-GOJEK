import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var tabIndex = 0;

  final count = 0.obs;

  void changeTabIndex(int index) {
    tabIndex = index;
    update();
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

  void increment() => count.value++;
}
