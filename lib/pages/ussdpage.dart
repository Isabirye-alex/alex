//
// import 'package:flutter/material.dart';
// import '../screens/bodyscreen.dart';
// import '../shared/widgets/callbutton.dart';
// import '../shared/widgets/circular_container.dart';
// import '../utilis/constants/text_strings.dart';
// import '../shared/widgets/ussd_text_field.dart';
// class UssdPage extends StatelessWidget {
//   const UssdPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     appBar: AppBar(
//       title: Text('USSD', style: TextStyle(color: Colors.white)),
//       backgroundColor: Colors.orange,
//     ),
//         body: SingleChildScrollView(
//               child:
//                 Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Ready(),
//                   Container(
//                       margin: EdgeInsets.all(10),
//                       child: Column(
//                           children: [
//                             Text(Texts.ussdText1, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey)),
//                             SizedBox(height: 8),
//                             Row(
//                               // mainAxisAlignment: MainAxisAlignment.space,
//                               children: [
//                                 CircularContainer(width: 6, height: 6, color: Colors.grey, radius: 6),
//                                 Text(Texts.ussdText2, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey)),
//
//                                   ],
//                                 ),
//                             Row(
//                               // mainAxisAlignment: MainAxisAlignment.space,
//                               children: [
//                                 CircularContainer(width: 6, height: 6, color: Colors.grey, radius: 6),
//                                 Flexible(child: Text(Texts.ussdText3, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey))),
//
//                                   ],
//                                 ),
//                             SizedBox(height: 8),
//                             Text(Texts.ussdText4, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey)),
//                             SizedBox(height: 8),
//                             UssdTextField(text: 'USSD Code',),
//                             SizedBox(height: 16),
//                             CallButton()
//                           ]
//                       )
//
//                     )
//                   ]
//                   ),
//         )
//     );
//   }
// }
//
//
//
