import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/vehicle_registration_controller.dart';

class VehicleRegistrationView extends GetView<VehicleRegistrationController> {
  const VehicleRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const h_20 = SizedBox(
      height: 20,
    );
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Vehicle Registration',
              style: textTheme.headline1,
            ),
            centerTitle: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleAndText(
                      title: "Number plate", hint: "", textTheme: textTheme),
                  h_20,
                  titleAndText(title: "Owner", hint: "", textTheme: textTheme),
                  h_20,
                  titleAndText(
                      title: "Vehicle brand",
                      hint: "",
                      textTheme: textTheme,
                      onTap: () {
                        Get.bottomSheet(
                          bottomSheet(textTheme: textTheme),
                          isDismissible: true,
                        );
                      },
                      controller: controller.vehicleBrandController,
                      disable: true,
                      icon: Icons.arrow_drop_down),
                  h_20,
                  titleAndText(
                      title: "Vehicle type",
                      hint: "",
                      textTheme: textTheme,
                  ),
                ],
              ),
            ),
          ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.VEHICLE_REGISTRATION);
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
        ),
      ),
    );
  }

  Widget titleAndText(
      {required String title,
      required String hint,
      required TextTheme textTheme,
      TextEditingController? controller,
      IconData? icon,
      bool? disable,
      TextInputFormatter? format,
      Function()? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.headline2,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          readOnly: disable ?? false,
          onSaved: (value) {},
          onTap: onTap,
          obscureText: false,
          decoration: InputDecoration(hintText: hint, suffixIcon: Icon(icon)),
        ),
      ],
    );
  }

  Widget bottomSheet({required TextTheme textTheme}) {
    return Container(
        height: Get.height * 0.5,
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/x-icon.png",
                      height: 50,
                      width: 50,
                    ),
                    onPressed: () {
                      Get.back();
                    })),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    "What do you want to register for?",
                    style: textTheme.headline1!.copyWith(fontSize: 23),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, itemBuilder) {
                        return ListTile(
                          onTap: () {
                            controller.selectedItem.value = itemBuilder;
                            controller.vehicleBrandController.text =
                                controller.motorcycleBrand[itemBuilder];
                            Get.back();
                          },
                          title: Text(
                            controller.motorcycleBrand[itemBuilder],
                            style: textTheme.headline1!.copyWith(fontSize: 18),
                          ),
                        );
                      },
                      itemCount: controller.motorcycleBrand.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
