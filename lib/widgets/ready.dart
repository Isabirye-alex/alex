import 'package:flutter/material.dart';

class ReadyWidget extends StatelessWidget {
  const ReadyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child:Text('Ready!', style: TextStyle(color: Colors.white, fontSize: 20),));
  }
}
