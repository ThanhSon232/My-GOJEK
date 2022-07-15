import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/password_controller.dart';

class PasswordView extends GetView<PasswordController> {
  const PasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PasswordView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
