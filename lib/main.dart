import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_gojek_driver/app/data/model/driver_entity.dart';
import 'package:my_gojek_driver/app/data/model/vehicle_list_entity.dart';
import 'package:my_gojek_driver/app/themes/theme.dart';

import 'app/routes/app_pages.dart';

void main() async{
  if(!Hive.isAdapterRegistered(0)){
    Hive.registerAdapter(DriverEntityAdapter());
    Hive.registerAdapter(VehicleListEntityAdapter());
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var box = await Hive.openBox("box");
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: theme,
    ),
  );
}
