import 'package:africa/controllers/ussd_text_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../controllers/text_controller.dart';

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
    // sendUssdRequest('');
    // print(sessionLogs.join());
  }

  void sendUssdRequest(String userInput ) async {
    try{
    final response =await http.post(
        Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd'),
        body: <String, String>{
          'phoneNumber': '+256706432259',
          'text': sessionText
        });
    print(response.body.toString());}
        catch(e) {
      print(e.toString());
        }
  }


  // void sendUssdRequest) async {
  //
  //   // final phone = inputController.controller.text.trim();
  //   //
  //   // if (phone.isEmpty) {
  //   //   sessionLogs.add("Please enter a phone number.");
  //   //   print(sessionLogs.join());
  //   //   update();
  //   //   return;
  //   // }
  //   //
  //   // if (userInput.isNotEmpty) {
  //   //   sessionText += '*$userInput';
  //   //   print(sessionText);
  //   }
    // http.post(
    //   Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(<String, String>{'title': title}),
    // );



    // var uri = Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd');
    // var request = http.post('POST', uri);
    //
    // http.post(
    //     Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd'),
    //   body: <String, String>{
    //     'phoneNumber': phone,
    //     'text':sessionText
    //   }
    // );
    //
    // request.fields.addAll({
    //   'phoneNumber': phone,
    //   'text': sessionText,
    // });
    // request.headers.addAll({
    //   'Cookie': 'ci_session=CUSTOM_COOKIE_ID',
    // });
    // try {
    //   var response =await http.post(
    //       Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd'),
    //       body: <String, String>{
    //         'phoneNumber': phone,
    //         'text': sessionText
    //       });
    //
    //   print(response);

      // if (response.statusCode == 200) {
      //   final responseBody = await response.stream.bytesToString();
      //   sessionLogs.add("SESSION_INPUT: $userInput");
      //   sessionLogs.add("USSD: $responseBody");
      //   sessionController.ucontroller.clear();
      // } else {
      //   sessionLogs.add("Error: ${response.reasonPhrase}");
      // }
  //   } catch (e) {
  //     sessionLogs.add("Request failed: $e");
  //   }
  //   print(sessionLogs.join());
  //   print(sessionText);
  //   update();
  // }
}
