import 'package:africa/features/domain/classes/register_dialog.dart';
import 'package:countries/countries.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/auth/user_model.dart';
import '../features/auth/user_view.dart';
import '../features/domain/classes/view_widget_model.dart';
import 'countries_controller.dart';

class UserController extends GetxController {
  late CountriesController countriesController;
  final  country = Country();
  static UserController get instance => Get.find();
  late final TextEditingController phoneController = TextEditingController();

  void handleContactRegistration() async {
    final phone = phoneController.text.trim();
    if (phone.isNotEmpty) {
      final user = UserView(
        id: 1,
        phoneNumber: phone,
      );
      await UserDatabase.instance.insertOrUpdateUser(user);
      Get.snackbar('User saved successfully', 'You can now continue',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          backgroundColor: Colors.orange,
          colorText: Colors.white
      );
      Get.back();
    } else {
      Get.snackbar('Error', 'Phone number cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 4),
          backgroundColor: Colors.red,
          colorText: Colors.white
      );
    }
  }

  void checkUserStatus() async {
    List<UserView> users = await UserDatabase.instance.getUsers();

    // Check if any user has a non-empty phone number
    final hasPhone = users.any((u) => u.phoneNumber.trim().isNotEmpty);

    if (hasPhone) {
      void checkUserStatus(BuildContext context) async {
        List<UserView> users = await UserDatabase.instance.getUsers();

        final hasPhone = users.any((u) => u.phoneNumber.trim().isNotEmpty);

        if (hasPhone) {
          Get.dialog(
            Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ViewWidget(), // Show as popup
              ),
            ),
            barrierDismissible: false,
            barrierColor: Colors.black.withAlpha(70),
          );
        }
        else {
          Get.dialog(
            RegisterDialog(),
            barrierDismissible: false,
          );
        }
      }
  }
}
}