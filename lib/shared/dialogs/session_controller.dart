import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UssdController extends GetxController {

  static UssdController get instance => Get.find();
  final phoneController = TextEditingController();
  final inputController = TextEditingController();
  final sessionLogs = <String>[];
  String sessionText = '';

  void startSession() {
    sessionText = '';
    sessionLogs.clear();
    update();
    sendUssdRequest('');
  }

  void sendUssdRequest(String userInput) async {
    final phone = phoneController.text.trim();

    if (phone.isEmpty) {
      sessionLogs.add("Please enter a phone number.");
      update();
      return;
    }

    if (userInput.isNotEmpty) {
      sessionText += '*$userInput';
    }

    var uri = Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd');
    var request = http.MultipartRequest('POST', uri);

    request.fields.addAll({
      'phoneNumber': phone,
      'text': sessionText,
    });

    request.headers.addAll({
      'Cookie': 'ci_session=CUSTOM_COOKIE_ID',
    });

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        sessionLogs.add("SESSION_INPUT: $userInput");
        sessionLogs.add("USSD: $responseBody");
        inputController.clear();
      } else {
        sessionLogs.add("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      sessionLogs.add("Request failed: $e");
    }

    update();
  }
}
