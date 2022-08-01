import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class OrderInformation extends StatelessWidget {
  void Function()? onPressed;
  void Function()? myLocationButton;

  OrderInformation({Key? key, this.onPressed, this.myLocationButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var h = (size.height * 0.55).obs;

    return Obx(
      () => AnimatedPositioned(
          width: size.width,
          height: size.height - h.value,
          top: h.value,
          duration: const Duration(milliseconds: 250),
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              int sensitivity = 8;
              if (details.delta.dy > sensitivity) {
                h.value = size.height * 0.55;
              } else if (details.delta.dy < -sensitivity) {
                h.value = 0;
              }
            },
            child: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: 30,
                        child: const Divider(
                          height: 5,
                          thickness: 5,
                          color: Colors.grey,
                        ),
                      ),
                      ListTile(
                        leading: Image.asset(
                          "assets/simpson.png",
                          height: 40,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        title: const Text(
                          "Order by",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text("Trần Thanh Sơn"),
                        trailing: IconButton(
                            icon: const Icon(
                              Icons.call,
                              color: Colors.green,
                            ),
                            onPressed: () async {
                              await FlutterPhoneDirectCaller.callNumber(
                                  "12345678");
                            }),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Image.asset(
                          "assets/profile.png",
                          height: 40,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        title: Text(
                          "Bệnh viện đa khoa khu vực hóc môn",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                            "65/2B Bà Triệu, TT.Hóc môn, Hóc môn, Thành Phố Hồ Chí Minh, Việt Nam"),
                      ),
                      ListTile(
                        leading: Image.asset(
                          "assets/address.png",
                          height: 40,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        title: Text(
                          "Bệnh viện đa khoa khu vực hóc môn",
                          style: TextStyle(
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                            "65/2B Bà Triệu, TT.Hóc môn, Hóc môn, Thành Phố Hồ Chí Minh, Việt Nam"),
                      ),


                      Visibility(
                        visible: h.value == 0 ? true : false,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),

                            const Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                            ListTile(
                              title: Text(
                                "Tiền mặt",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: Text("09123đ"),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(
                              height: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                bottomSheet: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      onPressed: onPressed, child: Text("Start")),
                ),
              ),
            ),
          )),
    );
  }
}
