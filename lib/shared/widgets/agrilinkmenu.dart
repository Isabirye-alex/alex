import 'package:africa/features/domain/classes/view_widget_model.dart';
import 'package:africa/pages/ussdpage.dart';
import 'package:africa/shared/widgets/mcash_text_field.dart';
import 'package:flutter/material.dart';
import '../../controllers/text_controller.dart';
import '../../utilis/constants/text_strings.dart';
import 'package:get/get.dart';

class AgriMenu extends StatefulWidget {
  const AgriMenu({super.key});

  @override
  State<AgriMenu> createState() => _AgriMenuState();
}

class _AgriMenuState extends State<AgriMenu> {
  final TextController controller = TextController.instance;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      title: Text(Texts.mCashTitle),
      content: Container(
        margin: EdgeInsets.zero,
        width: 300,
        height: 400,
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
                Text(Texts.content16),
              ],
            ),
            McashTextField(text: ''),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.to(()=> ViewWidget()),
          child: const Text('CANCEL', style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () => controller.checkNumber2(),
          child: Text('SEND', style: TextStyle(color: Colors.blue)),
        )

      ],
    );
  }
}
//
//
// TextButton(
// onPressed: ()=> Get.generalDialog(
// barrierDismissible: true,
// barrierLabel: '',
// barrierColor: Colors.transparent, // keeps background visible
// transitionDuration: const Duration(milliseconds: 200),
// pageBuilder: (context, animation, secondaryAnimation) {
// return Center(child: controller.checkNumber2());
// },
// ),
// child: const Text('SEND', style: TextStyle(color: Colors.blue)),
// ),