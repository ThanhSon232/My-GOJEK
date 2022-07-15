import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_gojek_driver/app/themes/theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: theme,
    ),
  );
}
