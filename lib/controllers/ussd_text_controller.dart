import 'package:africa/shared/dialogs/session_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared/widgets/popup_widget_1.dart';

class UssdTextController extends GetxController {
  static UssdTextController get instance => Get.find();
  late final TextEditingController ucontroller = TextEditingController();
  final RxInt code = 0.obs;

  @override
  void onInit() {
    super.onInit();
    ucontroller.addListener(() {
      code.value = int.tryParse(ucontroller.text) ?? 0;
    });
  }

  void checkCode() async {
    final input = ucontroller.text.trim();

    // Check for empty input first
    if (input.isEmpty) {
      Get.snackbar(
        'Empty USSD',
        'Please enter a USSD code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Show loading indicator
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    // Simulate API call or processing delay
    await Future.delayed(Duration(seconds: 1));

    // Dismiss loading dialog
    Get.back();

    // Validate input
    final isValidUssd = RegExp(r'^\*\d+(\*\d+)*\#$').hasMatch(input);

    if (isValidUssd) {

      await UssdController.instance.startSession();

      Get.generalDialog(
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.transparent,
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return Center(child: PopupWidget1());
        });

    } else {
      // Display error message for invalid USSD
      Get.snackbar(
        'Invalid USSD',
        'Please enter a valid USSD code like *123#',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }


}