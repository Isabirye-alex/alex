import 'package:flutter/material.dart';

class RegisterContactScreen extends StatelessWidget {
  const RegisterContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Register Contact'),
      content: Container(
        margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width * 0.9,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Please enter the contact details below:'),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: 'Enter phone number',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter name',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('CANCEL', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () {
            // Add logic to save contact
            Navigator.of(context).pop();
          },
          child: const Text('SAVE', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
