import 'package:africa/controllers/ussd_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class UssdTextField extends StatelessWidget {
  const UssdTextField({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    final controller1 = Get.put(UssdTextController());
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.purple, fontSize: 15),
          hintText: text
      ),
      controller: controller1.ucontroller,
    );
  }
}
