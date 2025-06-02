import 'dart:convert';
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
    _futureResults =
        sendUssdRequestWithResponse(''); // Or an initial input like '1'
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
  throw Exception('Error:$e\n');
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
          final options = snapshot.data!.options ?? [];
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
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      content: Material(
        child: Container(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width * 0.9,
          child: buildFutureBuilder(),
        ),
      ),
    );

  }
}

