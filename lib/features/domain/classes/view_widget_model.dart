import 'dart:convert';
import 'package:africa/features/domain/classes/ussd_view_object.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    _futureResults = sendUssdRequestWithResponse(''); // Or an initial input like '1'
  }

  Future<UssdViewObject> sendUssdRequestWithResponse(String userInput) async {
    String sessionText = '';

    final response = await http.post(
      Uri.parse('https://newtest.mcash.ug/wallet/api/client/ussd'),
      body: <String, String>{
        'phoneNumber': '+256706432259',
        'text': '{$sessionText + *$userInput}',
      },
    );
    if (response.statusCode == 201) {
      return UssdViewObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to connect.');
    }
  }

  FutureBuilder<UssdViewObject> buildFutureBuilder() {
    return FutureBuilder<UssdViewObject>(
      future: _futureResults,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final options = snapshot.data!.text;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(options[index]),
                onTap: () {
                  // Handle option tap here
                },
              );
            },
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
      decoration: BoxDecoration(),
        child: buildFutureBuilder(),
    );
  }
}

