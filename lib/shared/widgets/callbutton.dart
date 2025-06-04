import 'package:africa/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return GestureDetector(
      onTap: () async {
        Get.dialog(
          Center(child: CircularProgressIndicator()),
          barrierDismissible: false);
        await Future.delayed(Duration(seconds: 2));
        Get.back();
        controller.checkUserStatus();
      },
      child: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.green),
        child: Center(
          child: Text(
            'CALL',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

