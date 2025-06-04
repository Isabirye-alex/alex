import 'package:flutter/material.dart';
import '../../../shared/reusables/countries_widget.dart';

void showRegisterDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withAlpha(70),
    builder: (BuildContext context) {
      return const RegisterDialog();
    },
  );
}
class RegisterDialog extends StatelessWidget {
  const RegisterDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        insetPadding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          child: RegisterScreen(),
        ),
      ),
    );
  }
}
