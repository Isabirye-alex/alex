import 'package:flutter/material.dart';
import 'package:africa/pages/contact.dart';
import 'package:africa/database/store_contact.dart';
import 'package:get/get.dart';


class ContactProvider extends GetxController {
  static ContactProvider get instance => Get.find();
  final List<Contact> _contacts = [];

  List<Contact> get contact => _contacts;

  Future<void> addContact(String phone, String root) async {
    try {
      final newContact = Contact(phone: phone, root: root);
      await PhoneNumber.instance.insertContact(newContact);
      await loadContact(); // Reload after insert
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add contact: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackStyle: SnackStyle.FLOATING,
      );
      Get.back();
    }
  }


  Future<void> loadContact({bool showError = true}) async {
    try {
      final fetchedContacts = await PhoneNumber.instance.getContact();
      _contacts.clear();
      _contacts.addAll(fetchedContacts);
      update();
    } catch (e) {
      if (showError) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar(
            'Error',
            'Failed to load contacts: $e',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackStyle: SnackStyle.FLOATING,
          );
        });
      }
    }
  }



}