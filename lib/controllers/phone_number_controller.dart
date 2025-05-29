import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PhoneController extends GetxController {
  static PhoneController get instance => Get.find();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  final List<TextInputFormatter> phoneInputFormatters = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(15),
  ];

  bool isValidPhoneNumber(String number) {
    final pattern = RegExp(r'^\+?[0-9]{7,15}$');
    return pattern.hasMatch(number);
  }

  String? validatePhoneNumber([String? value]) {
    final text = (value ?? phoneController.text).trim();
    if (text.isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!isValidPhoneNumber(text)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  bool validateForm() {
    final isValid = formKey.currentState?.validate() ?? false;
    return isValid;
  }

  void clearPhone() {
    phoneController.clear();
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
