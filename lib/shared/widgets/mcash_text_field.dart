import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/text_controller.dart';

class McashTextField extends StatelessWidget {
  const McashTextField({super.key, required this.text});
  final String text;


  @override
  Widget build(BuildContext context) {
    final controller3 = Get.put(TextController());
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.purple, fontSize: 15),
          hintText: text
      ),
      controller: controller3.controller,
    );
  }
}
