import 'package:flutter/material.dart';

import '../utilis/constants/text_strings.dart';

class PopupWidget1 extends StatelessWidget {
  const PopupWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Texts.title),
      content: Column(children: [
        // PopUpTile(text: '', child: )
      ],
      ),
      
    );
  }
}

class PopUpTile extends StatelessWidget {
  const PopUpTile({
    super.key, required this.text,required this.child,
  });
  final String text;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>child));},
    );
  }
}
