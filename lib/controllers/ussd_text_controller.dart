import 'package:africa/widgets/popup_widget_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    // Get input from TextController
    final input = ucontroller.text.trim();

    //Show loading indicator
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    // Simulate API call or processing delay
    await Future.delayed(Duration(seconds: 2));

    //Dismiss loading
    Get.back();

    // Validate input (basic USSD pattern: *123# or *123*1# etc.)
    final isValidUssd = RegExp(r'^\*\d+(\*\d+)*\#$').hasMatch(input);

    if(ucontroller.value.text.isEmpty){
      Get.snackbar(
        'Empty USSD',
        'Please enter a USSD code',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.back();
    }
    if (isValidUssd) {
      Get.generalDialog(
        barrierDismissible: true,
        barrierLabel: '',
        barrierColor: Colors.transparent, // Background stays visible
        transitionDuration: Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) {
          return Center(child: PopupWidget1());
        },
      );


    } else {
      //Display error message
      Get.snackbar(
        'Invalid USSD',
        'Please enter a valid USSD code like *123#',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Get.back();
    }
  }

}