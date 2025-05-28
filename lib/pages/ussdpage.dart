import 'package:africa/widgets/circular_container.dart';
import 'package:flutter/material.dart';
import '../screens/bodyscreen.dart';
import '../utilis/constants/text_strings.dart';

class UssdPage extends StatelessWidget {
  const UssdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('USSD', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.orange,
    ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Ready(),
                Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                        children: [
                          Text(Texts.ussdText1, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey)),
                          SizedBox(height: 8),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.space,
                            children: [
                              CircularContainer(width: 6, height: 6, color: Colors.grey, radius: 6),
                              Text(Texts.ussdText2, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey)),

                                ],
                              ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.space,
                            children: [
                              CircularContainer(width: 6, height: 6, color: Colors.grey, radius: 6),
                              Flexible(child: Text(Texts.ussdText3, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey))),

                                ],
                              ),
                          SizedBox(height: 8),
                          Text(Texts.ussdText4, style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey)),
                          SizedBox(height: 8),
                          UssdTextField(),
                          SizedBox(height: 16),
                          CallButton()
                        ]
                    )

                  )
    ]
    )
        )
    );
  }
}



class CallButton extends StatelessWidget {
  const CallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.green),
      child: Center(child: Text('CALL', style: TextStyle(fontSize: 20, color: Colors.white))),
    );
  }
}
class UssdTextField extends StatelessWidget {
  UssdTextField({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Colors.purple, fontSize: 15),
        hintText: 'USSD Code'
      ),
      controller: _controller,
    );
  }
}
