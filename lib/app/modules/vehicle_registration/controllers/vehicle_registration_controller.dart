import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gojek_driver/app/modules/password/controllers/password_controller.dart';
import 'package:my_gojek_driver/app/modules/register/controllers/register_controller.dart';
import 'package:my_gojek_driver/app/modules/set_up_profile/controllers/set_up_profile_controller.dart';

class VehicleRegistrationController extends GetxController {
  //TODO: Implement VehicleRegistrationController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  List<String> carBrand = [
    "Abarth",
    "Alfa Romeo",
    "Aston Martin",
    "Audi",
    "Bentley",
    "BMW",
    "Bugatti",
    "Cadillac",
    "Chevrolet",
    "Chrysler",
    "Citroën",
    "Dacia",
    "Daewoo",
    "Daihatsu",
    "Dodge",
    "Donkervoort",
    "DS",
    "Ferrari",
    "Fiat",
    "Fisker",
    "Ford",
    "Honda",
    "Hummer",
    "Hyundai",
    "Infiniti",
    "Iveco",
    "Jaguar",
    "Jeep",
    "Kia",
    "KTM",
    "Lada",
    "Lamborghini",
    "Lancia",
    "Land Rover",
    "Landwind",
    "Lexus",
    "Lotus",
    "Maserati",
    "Maybach",
    "Mazda",
    "McLaren",
    "Mercedes-Benz",
    "MG",
    "Mini",
    "Mitsubishi",
    "Morgan",
    "Nissan",
    "Opel",
    "Peugeot",
    "Porsche",
    "Renault",
    "Rolls-Royce",
    "Rover",
    "Saab",
    "Seat",
    "Skoda",
    "Smart",
    "SsangYong",
    "Subaru",
    "Suzuki",
    "Tesla",
    "Toyota",
    "Volkswagen",
    "Volvo"
  ];


  var setUpProfileController = Get.find<SetUpProfileController>();
  var registerController = Get.find<RegisterController>();
  var passwordController = Get.find<PasswordController>();

  TextEditingController vehicleBrandController = TextEditingController();
  TextEditingController numberPlateController = TextEditingController();
  TextEditingController vehicleType = TextEditingController();
  TextEditingController ownerName = TextEditingController();

  String? ownerNameValidator(String value){
    if(value.isEmpty){
      return "This field must be filled";
    }
    return RegExp(r'^[a-z A-Z,.\-]+$',
        caseSensitive: false, unicode: true, dotAll: true)
        .hasMatch(value)
        ? null
        : "Name can't contains special characters or number";
  }

  String? numberPlateValidator(String value){
    if(value.isEmpty) return "This field must be filled";

    return value.length < 6 ? "Please enter a real number plate" : null;
  }


  String? vehicleBrandValidator(String value){
    if(value.isEmpty) return "This field must be filled";

    return null;
  }


  String? vehicleTypeValidator(String value){
    if(value.isEmpty) return "This field must be filled";

    return  null;
  }

  bool validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form!.validate()) {
      return true;
    }
    return false;
  }
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
