import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class USSDSimulator extends StatefulWidget {
  @override
  _USSDSimulatorState createState() => _USSDSimulatorState();
}

class _USSDSimulatorState extends State<USSDSimulator> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController inputController = TextEditingController();
  List<String> sessionLogs = [];
  String sessionText = '';

  Future<void> sendUSSDRequest() async {
    final phone = phoneController.text.trim();
    final userInput = inputController.text.trim();

    if (phone.isEmpty) return;

    sessionText += userInput.isNotEmpty ? '*$userInput' : '';

    var uri = Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd');
    var request = http.MultipartRequest('POST', uri);
    request.fields.addAll({
      'phoneNumber': phone,
      'text': sessionText,
    });

    request.headers.addAll({
      'Cookie': 'ci_session=g54bpto7dekbsdtoes64e7f8gcsi2mk1',
    });

    var response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      setState(() {
        sessionLogs.add("You: $userInput");
        sessionLogs.add("USSD: $responseBody");
        inputController.clear();
      });
    } else {
      setState(() {
        sessionLogs.add("Error: ${response.reasonPhrase}");
      });
    }
  }

  void startNewSession() {
    sessionText = '';
    sessionLogs.clear();
    inputController.clear();
    sendUSSDRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("USSD Simulator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number (e.g., +256700123456)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: startNewSession,
              child: Text('Start USSD Session'),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: sessionLogs.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(sessionLogs[index]),
                  );
                },
              ),
            ),
            const Divider(),
            TextField(
              controller: inputController,
              decoration: InputDecoration(
                labelText: 'Enter USSD Input (e.g., 1)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: sendUSSDRequest,
              child: Text('Send Input'),
            ),
          ],
        ),
      ),
    );
  }
}
