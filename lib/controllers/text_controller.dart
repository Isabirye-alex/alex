import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/agrilinkmenu.dart';
import '../widgets/fuel_menu.dart';
import '../widgets/pop_up_widget2.dart';

class TextController extends GetxController {
  static TextController get instance => Get.find();
  late final TextEditingController controller = TextEditingController();
  final RxInt number = 0.obs;

  @override
  void onInit() {
    super.onInit();
    controller.addListener(() {
      number.value = int.tryParse(controller.text) ?? 0;

    });
  }
  void checkNumber() {
    if (number.value == 1) {
      Get.to(()=>McashMenu());
    } else if (number.value == 2) {
      Get.to(()=>AgriLinkMenu());
    } else if (number.value == 3) {
      Get.to(()=>FuelMenu());
    } else if (number.value == 0){
      Get.to(()=>Page);
    } else if (number.value == 00){
      Get.to(()=>Page);
    }
    else {
      Get.snackbar(
        '',
        'Please enter a valid number',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }

  }
  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}