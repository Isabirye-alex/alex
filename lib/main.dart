import 'package:africa/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/user_controller.dart';
void main() {
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: HomeScreen(),
    );
  }
}
