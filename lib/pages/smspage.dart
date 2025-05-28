import 'package:flutter/material.dart';

class SmsPage extends StatelessWidget {
  const SmsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body:Center(
      child: Text('Messages sent'),
        )
    );
  }
}
