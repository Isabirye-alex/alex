import 'package:africa/widgets/ussd_text_field.dart';
import 'package:flutter/material.dart';
import '../controllers/text_controller.dart';
import '../utilis/constants/text_strings.dart';
import 'package:get/get.dart';
class PopupWidget1 {
  final controller = Get.put(TextController());

  Future openDialog(BuildContext context) =>
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text(Texts.title),
                content: Container(

                  margin: EdgeInsets.zero,
                  width: 300,
                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Texts.content11),
                      Text(Texts.content12),
                      Text(Texts.content13),
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
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  },
                      child: Text(
                          'CANCEL', style: TextStyle(color: Colors.red))),
                  TextButton(
                    onPressed: () => Get.to(() => controller.checkNumber()),
                    child: Text('SEND', style: TextStyle(color: Colors.blue)),
                  )
                ],
              )
      );
}