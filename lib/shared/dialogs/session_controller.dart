import 'package:africa/controllers/ussd_text_controller.dart';
import 'package:africa/features/domain/classes/ussd_view_object.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../controllers/text_controller.dart';
import 'dart:convert';

class UssdController extends GetxController {
  static UssdController get instance => Get.find();
  final sessionController = Get.put(UssdTextController());
  final inputController = Get.put(TextController());
  final sessionLogs = <String>[];
  String sessionText = '';

  void startSession() {
    sessionText = '';
    sessionLogs.clear();
    update();
  }

  // void sendUssdRequest(String userInput) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd'),
  //       body: <String, String>{
  //         'phoneNumber': '+256706432259',
  //         'text': sessionText,
  //       },
  //     );
  //     print(response.body.toString());
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }


}
