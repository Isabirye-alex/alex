import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/domain/classes/view_widget_model.dart';
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
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    await Future.delayed(Duration(seconds: 1));
    Get.back();
    final isValidUssd = RegExp(r'^\*\d+(\*\d+)*\#$').hasMatch(input);
    if (isValidUssd) {
        try {
        Get.generalDialog(
            barrierDismissible: true,
            barrierLabel: '',
            barrierColor: Colors.transparent,
            transitionDuration: Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) {
              return  ViewWidget();
            });
      } catch (e) {
        throw Exception('Error: $e');
      }
    } else {
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