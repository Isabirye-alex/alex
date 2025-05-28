
import 'package:africa/widgets/popup_widget_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(TextController());
    return GestureDetector(
      onTap: () {
        Get.generalDialog(
          barrierDismissible: true,
          barrierLabel: '',
          barrierColor: Colors.transparent, // keeps background visible
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (context, animation, secondaryAnimation) {
            return Center(
                child: PopupWidget1());
          },
        );
      },

      child: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.green),
        child: Center(child: Text('CALL', style: TextStyle(fontSize: 20, color: Colors.white))),
      ),
    );
  }
}

