import 'package:get/get.dart';

import '../../../data/vehicle.dart';

class SetUpProfileController extends GetxController {
  //TODO: Implement SetUpProfileController
  List<Vehicle> vehicles = [
    Vehicle(name: "Bike driver", description: "Get orders for ride, food, and send.", img: "assets/vehicleIcon/bike.png"),
    Vehicle(name: "Car4S", description: "Get orders for Cars4S", img: "assets/vehicleIcon/car.png"),
    Vehicle(name: "Car7S", description: "Get orders for Cars7S", img: "assets/vehicleIcon/car.png"),
    Vehicle(name: "Car16S", description: "Get orders for Cars16S", img: "assets/vehicleIcon/car.png"),
  ];

  RxBool defaultGender = true.obs;


  final selectedIndex = 0.obs;
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
