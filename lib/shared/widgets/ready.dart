import 'package:africa/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ReadyWidget extends StatefulWidget {
  const ReadyWidget({super.key});

  @override
  State<ReadyWidget> createState() => _ReadyWidgetState();
}

class _ReadyWidgetState extends State<ReadyWidget> {

  @override
  Widget build(BuildContext context) {
    final displayController = Get.find<UserController>();
    return Center(
      child: Obx(() => Text(
        displayController.displayText.value,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      )),
    );
  }
}
