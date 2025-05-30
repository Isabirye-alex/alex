import 'package:africa/controllers/phone_number_controller.dart';
import 'package:africa/features/countries_main_class.dart';
import 'package:africa/features/insert_contact.dart';
import 'package:africa/pages/ussdpage.dart';
import 'package:africa/screens/bodyscreen.dart';
import 'package:africa/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import 'countries_class.dart';

class RegisterContactScreen extends StatefulWidget {
  const RegisterContactScreen({super.key});

  @override
  State<RegisterContactScreen> createState() => _RegisterContactScreenState();
}

class _RegisterContactScreenState extends State<RegisterContactScreen> {
  final contact = Get.put(ContactProvider());
  final inputController = Get.put(PhoneController());
  Countries? selectedCountry;

  void _onCountrySelected(Countries country) {
    setState(() {
      selectedCountry = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.55,
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('at', style: TextStyle(fontSize: 50, color: Colors.orange)),
                    SizedBox(width: 8),
                    Container(height: 30, width: 2, color: Colors.grey),
                    SizedBox(width: 8),
                    Text('SandBox', style: TextStyle(color: Colors.orange, fontSize: 30)),
                  ],
                ),
                SizedBox(height: 15),
                Text(Texts.paragraph, style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
                SizedBox(height: 10),
                Text(Texts.paragraph2, style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
                SizedBox(height: 15),

                CountriesMainClass(onCountrySelected: _onCountrySelected),

                SizedBox(height: 10),
                Text(Texts.paragraph3, style: TextStyle(fontSize: 10), textAlign: TextAlign.center),
                GestureDetector(
                  onTap: _launchURL,
                  child: Text(
                    'https://africastalking.com/terms_of_service',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.lightBlueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('CANCEL', style: TextStyle(color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: () async {
                        if (inputController.formKey.currentState!.validate()) {
                          if (selectedCountry == null) {
                            return;
                          }


                          final userContact = inputController.phoneController.text.trim();
                          final countryCode = selectedCountry!.code;

                          try {

                            Get.dialog(Center(child: CircularProgressIndicator()), barrierDismissible: false);
                            await Future.delayed(Duration(seconds: 1));

                            Get.back();

                            await contact.addContact(userContact, countryCode);
                            Navigator.of(context).pop();
                             Get.snackbar('Success', 'Registration Successful',
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.green,
                                snackStyle: SnackStyle.FLOATING,
                                backgroundColor: Colors.lightBlueAccent);
                            return;

                          } catch (e) {
                            throw Exception('Error: $e');
                          }
                        } else {
                          Get.snackbar('Invalid', 'Please correct the phone number',
                              backgroundColor: Colors.red, colorText: Colors.white);
                        }
                      },

                      child: Text('PROCEED', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    final Uri url = Uri.parse('https://africastalking.com/terms_of_service');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
