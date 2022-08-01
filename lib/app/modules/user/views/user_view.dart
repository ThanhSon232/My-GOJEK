import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            "Account",
            style: textTheme.headline1!.copyWith(color: Colors.white),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Image.asset(
              "assets/background.jpg",
              height: Get.height,
              fit: BoxFit.fitHeight,
            ),
            Positioned(
                top: Get.height * 0.20,
                child: Container(
                  height: Get.height - Get.height*0.2,
                  width: Get.width,
                  padding: EdgeInsets.only(top: Get.height*0.1, bottom: 10),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16))),
                  child: Column(
                    children: [
                        ListTile(
                          leading: const Icon(Icons.star, color: Colors.brown,),
                          title: Text("Assessment", style: textTheme.headline1,),
                          trailing: const Icon(
                            Icons.arrow_forward_ios
                          ),
                        ),
                      const Spacer(),
                      ListTile(
                        leading: const Icon(Icons.logout, color: Colors.brown,),
                        title: Text("Log out", style: textTheme.headline1,),
                        trailing: const Icon(
                            Icons.arrow_forward_ios
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Positioned(
                top: Get.height * 0.13,
                child: SizedBox(
                  height: Get.height * 0.15,
                  width: Get.width,
                  child: Card(
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                      leading: Image.asset("assets/Flexibility.png"),
                      title: Text("Tran Thanh Son", style: textTheme.headline1,),
                      subtitle: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("09123456798", style: textTheme.headline2,),
                          Text("Dong Nai Que Toi", style: textTheme.headline2,),
                          Text("Sirius trái số 67zz", style: textTheme.headline2,)
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ));
  }
}
