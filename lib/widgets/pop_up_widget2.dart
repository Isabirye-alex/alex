import 'package:flutter/material.dart';
import 'package:africa/widgets/ussd_text_field.dart';
import '../utilis/constants/text_strings.dart';

class McashMenu extends StatelessWidget {
  const McashMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
Future openDialog(BuildContext context) => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context)=> AlertDialog(
      title: Text(Texts.mCashTitle),
      content: Container(

        margin: EdgeInsets.zero,
        width: 300,
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Texts.content21),
            Text(Texts.content22),
            Text(Texts.content23),
            Text(Texts.content24),
            Text(Texts.content25),
            Text(Texts.content26),
            Text(Texts.content27),
            Text(Texts.content28),
            Text(Texts.content29),
            Text(Texts.content230),
            SizedBox(height: 10),
            Row(
              children: [
                Text(Texts.content14),
                Text(Texts.content15),
                Text(Texts.content16)
              ],
            ),
            UssdTextField(text: ''),

          ],

        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('CANCEL', style: TextStyle(color: Colors.red))),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('SEND', style: TextStyle(color: Colors.blue)),
        )
      ],
    ));
