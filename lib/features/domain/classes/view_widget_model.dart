import 'package:africa/features/domain/classes/ussd_view_object.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ViewWidget extends StatefulWidget {
  const ViewWidget({super.key});
  @override
  State<ViewWidget> createState() => _ViewWidgetState();
}
class _ViewWidgetState extends State<ViewWidget> {
  late Future<UssdViewObject> _futureResults;
  @override
  void initState() {
    super.initState();
    _futureResults = sendUssdRequestWithResponse('');
  }
  Future<UssdViewObject> sendUssdRequestWithResponse(String userInput) async {
    String sessionText = '';
    try {
      final response = await http.post(
        Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd'),
        body: <String, String>{
          'phoneNumber': '+256706432259',
          'text': sessionText,
        },
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        return UssdViewObject.fromUssdString(response.body, phoneNumber: '+256706432259');
      } else {
        throw Exception('Failed to connect. Status: ${response.statusCode}');
      }
    } catch(e) {
  throw Exception('Error:$e');
  }
}
  FutureBuilder<UssdViewObject> buildFutureBuilder() {
    return FutureBuilder<UssdViewObject>(
      future: _futureResults,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: TextStyle(fontSize: 16, color: Colors.red),
          );
        } else if (snapshot.hasData) {
          final ussdObject = snapshot.data!;
          return Column(
               children: [
                 Flexible(
                   child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: ussdObject.options?.length ?? 0,
                        itemBuilder: (context, index) {
                          if (ussdObject.options == null || index >= ussdObject.options!.length) {
                            return const ListTile(title: Text('No options available'));
                          }
                          final option = ussdObject.options![index];
                          return ListTile(
                            dense: true,
                            visualDensity: VisualDensity(vertical: -4),
                            title: Text(option, style: TextStyle(fontSize: 16)),
                            onTap: () {},
                          );
                        },
                   ),
                 ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('CANCEL', style: TextStyle(color: Colors.red)),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text('SEND', style: TextStyle(color: Colors.blue)),
                    ),
                  ],
              )
            ],
          );
        } else {
          return const Text('No data found.');
        }
      },
    );
  }

  @override
    Widget build(BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height*0.7,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(70),
              blurRadius: 8,
              offset: Offset(0, 4), // X, Y offset
            ),
          ],
        ),
        child: Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          insetPadding: const EdgeInsets.all(20), // Controls space around the dialog
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.54,
              width: MediaQuery.of(context).size.width * 0.9, // Custom width
              child: Material(
                child: buildFutureBuilder(),
              ),
            ),
          ),
        ),
      );
    }

}

