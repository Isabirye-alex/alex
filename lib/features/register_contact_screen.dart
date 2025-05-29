import 'package:africa/features/countries_main_class.dart';
import 'package:africa/utilis/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterContactScreen extends StatelessWidget {
  const RegisterContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.95,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.55, // give enough height
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
                    Text(
                      'at',
                      style: TextStyle(fontSize: 50, color: Colors.orange),
                    ),
                    SizedBox(width: 8),
                    Container(height: 30, width: 2, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      'SandBox',
                      style: TextStyle(color: Colors.orange, fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  Texts.paragraph,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  Texts.paragraph2,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                CountriesMainClass(),
                SizedBox(height: 10),
                Text(
                  Texts.paragraph3,
                  style: TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: Text(
                    'https://africastalking.com/terms_of_service',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.lightBlueAccent,
                      decorationColor: Colors.blue,
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
                      child: Text(
                        'CANCEL',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'PROCEED',
                        style: TextStyle(color: Colors.blue),
                      ),
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


  _launchURL() async {
    final Uri url = Uri.parse('https://africastalking.com/terms_of_service');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}