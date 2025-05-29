import 'package:africa/pages/airtimepage.dart';
import 'package:africa/pages/paymentspage.dart';
import 'package:africa/pages/smspage.dart';
import 'package:africa/pages/ussdpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/register_contact_screen.dart';
import '../pages/voicepage.dart';
import '../widgets/dotted.dart';
import '../widgets/ready.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child:
            Column(
              children: [
                Ready(),
                Row(
                  children: [
                    DottedContainer(getIcon: Icons.perm_phone_msg_rounded,
                        getText: 'SMS',
                        screen: 0.40,
                        child: SmsPage()),
                    DottedContainer(getIcon: Icons.dialpad,
                        getText: 'USSD',
                        screen: 0.40,
                        child: UssdPage()),
                  ],
                ),
                Row(
                  children: [
                    DottedContainer(getIcon: Icons.payments,
                        getText: 'PAYMENTS',
                        screen: 0.40,
                        child: PaymentsPage()),
                    DottedContainer(getIcon: Icons.dialpad,
                        getText: 'AIRTIME',
                        screen: 0.40,
                        child: AirtimePage()),
                  ],
                ),
                Row(
                  children: [
                    DottedContainer(getIcon: Icons.wifi_calling_3,
                        getText: 'VOICE',
                        screen: 0.9,
                        child: VoicePage()),
                  ],
                ),
              ],
            ),
          ),
        ),
        SetupNumber(),
      ],
    );
  }
}

  class Ready extends StatelessWidget {
  const Ready({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.green[700]),
      child: ReadyWidget(),
    );
  }
}

class SetupNumber extends StatelessWidget {
  const SetupNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*1,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.grey[800]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('You need to set up a phone number', style: TextStyle(color: Colors.white),),
          GestureDetector(
              onTap: (){
                Get.generalDialog(
                    barrierDismissible: false,
                    barrierLabel: '',
                    barrierColor: Colors.transparent,
                    transitionDuration: Duration(milliseconds: 300),
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return Center(child: RegisterContactScreen());
                    });
              },
              child: Text('REGISTER', style: TextStyle(fontSize: 20, color: Colors.green),))
        ],
      ),
    );
  }
}

