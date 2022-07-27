import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        body: Stack(
      children: [
        const GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ),
        SafeArea(
          child: Positioned(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Container(
              height: 55,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/Flexibility.png",
                    height: 50,
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      //
                      // showDialog<void>(
                      //   barrierDismissible: true,
                      //   context: context,
                      //   builder: (BuildContext context) {
                      //     return customDialog(textTheme: textTheme);
                      //   },
                      // );
                      showGeneralDialog(
                          barrierColor: Colors.black.withOpacity(0.5),
                          transitionBuilder: (context, a1, a2, widget) {
                            return ScaleTransition(
                                alignment: Alignment.center,
                                scale: Tween<double>(begin: 0.25, end: 1)
                                    .animate(a1),
                                child: FadeTransition(
                                  opacity: Tween<double>(begin: 0.25, end: 1)
                                      .animate(a1),
                                  child: SafeArea(
                                      child:
                                          customDialog(textTheme: textTheme)),
                                ));
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                          barrierDismissible: true,
                          barrierLabel: '',
                          context: context,
                          pageBuilder: (context, animation1, animation2) {
                            return Container();
                          });
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 3,
                      child: Center(
                          child: Text(
                        "Inactive",
                        style: textTheme.headline1,
                      )),
                    ),
                  )),
                  SizedBox(
                    height: 50,
                    child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      child: Image.asset(
                        "assets/on_icon.jpg",
                        color: Colors.white,
                        height: 20,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          )),
        ),
      ],
    ));
  }

  Widget customDialog({required TextTheme textTheme}) {
    const divider = Divider(
      height: 1,
      color: Colors.black,
    );
    const h_20 = SizedBox(
      height: 20,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            height: Get.height * 0.25,
            width: Get.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Text(
                  "Active",
                  style: textTheme.headline1,
                ),
                h_20,
                divider,
                h_20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Automatically accept",
                        style: textTheme.headline1!.copyWith(fontSize: 16),
                      ),
                      CupertinoSwitch(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                h_20,
                divider,
                h_20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Credit",
                        style: textTheme.headline1!.copyWith(fontSize: 16),
                      ),
                      Text("thanhson232",
                          style: textTheme.headline1!.copyWith(fontSize: 16))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        h_20,
        FloatingActionButton(
            backgroundColor: Colors.white,
            child: Image.asset(
              "assets/x-icon.png",
              height: 50,
              width: 50,
            ),
            onPressed: () {
              Get.back();
            }),
      ],
    );
  }
}
