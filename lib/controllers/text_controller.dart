import 'package:africa/features/domain/classes/view_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/widgets/agrilinkmenu.dart';
import '../shared/widgets/fuel_menu.dart';
import '../shared/widgets/mcash_menu.dart';


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

  void checkNumber1() async {
    // final ussdController = Get.put(UssdController());

    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );

    await Future.delayed(Duration(seconds: 2));

    Get.back();

    switch (number.value) {

      case 1:
        // ussdController.sendUssdRequestWit('');
        showTransparentDialog(McashMenu());
        break;

      case 2:
        showTransparentDialog(AgriMenu());
        break;

      case 3:
        showTransparentDialog(FuelMenu());
        break;

      case 0:
        Get.to(() => Page); // Replace with actual widget
        break;
      default:
        Get.snackbar(
          '',
          'Please enter a valid number',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
    }
  }
  void checkNumber2() async {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
    await Future.delayed(Duration(seconds: 2));
    Get.back();
    switch (number.value) {
      case 1:
        showTransparentDialog(McashMenu());
        break;
      case 2:
        showTransparentDialog(AgriMenu());
        break;
      case 3:
        showTransparentDialog(FuelMenu());
        break;
      case 0:
        showTransparentDialog(ViewWidget());
      case 00:
        showTransparentDialog(ViewWidget());
        break;
      default:
        Get.snackbar(
          '',
          'Please enter a valid number',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
    }
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


  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}