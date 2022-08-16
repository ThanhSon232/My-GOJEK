import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/request_controller.dart';

class RequestView extends GetView<RequestController> {
  const RequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const h_20 = SizedBox(height: 20,);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          "assets/logo_gojek.png",
          height: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() => controller.isLoading.value ? CircularProgressIndicator() : Column(
              children: [
                customCard(textTheme: textTheme),
                h_20,
                Card(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Text(
                          "Income: ",
                          style: textTheme.headline2!
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          "đ ${controller.data["vehicleAndPrice"]["price"].toString()}",
                          style: textTheme.headline2!
                              .copyWith(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child:  Image.asset("assets/x-icon.png",color: Colors.red,height: 18,)
                  ),
                ),
              ),
              const SizedBox(width: 5,),
              Expanded(
                flex: 3,
                child: ElevatedButton(
                  onPressed: () async{
                    await controller.handleAccept();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.green),
                  child:   Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child:  Obx(() => Text("Accept ${controller.count.value}"))
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget address(
      {required TextTheme textTheme,
        required String title,
        required String subtitle,
        required bool isDes}) {
    return Row(
      children: [
        Icon(
          Icons.trip_origin,
          color: isDes ? Colors.blue : Colors.orange,
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: Get.width * 0.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.headline1!.copyWith(fontSize: 15),
              ),
              Text(
                subtitle,
                style: textTheme.headline3,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget customCard({required TextTheme textTheme}) {
    return Card(
      color: Colors.grey[100],
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            address(
                textTheme: textTheme,
                title: controller.data["startAddress"]["address"].toString().split(",")[0],
                subtitle:
                controller.data["startAddress"]["address"],
                isDes: false),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: CustomPaint(
                  size: const Size(1, 40),
                  painter: DashedLineVerticalPainter()),
            ),
            address(
                textTheme: textTheme,
                title: controller.data["destination"]["address"].toString().split(",")[0],
                subtitle:
                controller.data["destination"]["address"],
                isDes: true),
            const SizedBox(
              height: 10,
            ),
            Card(
              color: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    "Distance * ${double.parse(controller.data["distanceAndTime"]["distance"].toString()).toStringAsFixed(2)}km",
                    style: textTheme.headline2!.copyWith(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }

}

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

