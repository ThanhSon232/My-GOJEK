import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/income_controller.dart';

class IncomeView extends GetView<IncomeController> {
  const IncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const h_20 = SizedBox(
      height: 20,
    );
    const h_10 = SizedBox(
      height: 10,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Income',
            style: textTheme.headline1!.copyWith(fontSize: 25),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Summary of revenue",
                style: textTheme.headline1,
              ),
              h_20,
              //first card
              SizedBox(
                width: Get.width,
                child: Card(
                  color: Colors.grey[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today revenue",
                          style: textTheme.headline1!.copyWith(fontSize: 15),
                        ),
                        h_20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("0 đ", style: textTheme.headline1),
                                h_20,
                                Text(
                                  "O complete order today",
                                  style: textTheme.headline2,
                                )
                              ],
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shape: StadiumBorder()),
                                onPressed: () {},
                                child: const Text("Detail"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              h_20,
              //second card
              SizedBox(
                width: Get.width,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  elevation: 3,
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Balance",style: textTheme.headline2!.copyWith(fontSize: 15),),
                            Text("4.925.029đ",style: textTheme.headline1!,),
                          ],
                        ),
                        h_20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Icon(
                                  Icons.arrow_circle_down_sharp,
                                  color: Colors.green,
                                ),
                                h_10,
                                Text("Withdraw to bank",style: textTheme.headline2!.copyWith(fontSize: 15, color: Colors.green),),

                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Icon(
                                    Icons.schedule_rounded,
                                  color: Colors.green,
                                ),
                                h_10,
                                Text("Transaction history",style: textTheme.headline2!.copyWith(fontSize: 15,  color: Colors.green),),

                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ));
  }
}
