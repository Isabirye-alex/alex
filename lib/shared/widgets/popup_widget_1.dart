import 'package:africa/shared/widgets/pop1_text.dart';
import 'package:flutter/material.dart';
import '../../controllers/text_controller.dart';
import '../../utilis/constants/text_strings.dart';
import 'package:get/get.dart';

class PopupWidget1 extends StatefulWidget {
  const PopupWidget1({super.key});
  @override
  State<PopupWidget1> createState() => _PopupWidget1State();
}
class _PopupWidget1State extends State<PopupWidget1> {
  final controller = Get.put(TextController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Texts.title),
      content: Container(
        margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 200,
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
                Text(Texts.content16),
              ],
            ),
            PopUpField(text: ''),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('CANCEL', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () => controller.checkNumber1(),
          child: const Text('SEND', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
