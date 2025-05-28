import 'package:africa/widgets/pop_up_widget2.dart';
import 'package:flutter/material.dart';

class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        openDialog(context);
      },
      child: Container(
        height: 35,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.green),
        child: Center(child: Text('CALL', style: TextStyle(fontSize: 20, color: Colors.white))),
      ),
    );
  }
}

