import 'package:africa/controllers/user_controller.dart';
import 'package:africa/pages/airtimepage.dart';
import 'package:africa/pages/paymentspage.dart';
import 'package:africa/pages/smspage.dart';
import 'package:flutter/material.dart';
import '../pages/voicepage.dart';
import '../shared/widgets/dotted.dart';
import '../shared/widgets/ready.dart';
import 'package:get/get.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
                        onTap: ()=> controller.checkUserStatus(),
                    ),
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


