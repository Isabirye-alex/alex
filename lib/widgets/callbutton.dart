import 'package:africa/controllers/ussd_text_controller.dart';
import 'package:africa/widgets/popup_widget_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UssdTextController());
    return GestureDetector(
      onTap: () async {

        Get.dialog(
          Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );

        await Future.delayed(Duration(seconds: 2));


        Get.back();

        controller.checkCode();
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
  void showTransparentDialog(Widget child) {
    Get.generalDialog(
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(child: child);
      },
    );
  }

}
