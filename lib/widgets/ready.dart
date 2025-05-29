import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/insert_contact.dart';
class ReadyWidget extends StatelessWidget {
  const ReadyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final contactProvider = Get.put(ContactProvider());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      contactProvider.loadContact();
    });

    return GetBuilder<ContactProvider>(
      builder: (provider) {
        if (provider.contact.isEmpty) {
          return const Center(
            child: Text(
              'Ready!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        }
        return Container(
          color: Colors.black87,
          child: ListView.builder(
            itemCount: provider.contact.length,
            itemBuilder: (context, index) {
              final contact = provider.contact[index];
              return ListTile(
                title: Text(
                  '${contact.root}${contact.phone}',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
