import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/text_controller.dart';

class UssdTextField extends StatelessWidget {
  const UssdTextField({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TextController());
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.purple, fontSize: 15),
          hintText: text
      ),
      controller: controller.controller,
    );
  }
}
