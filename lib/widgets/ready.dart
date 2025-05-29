import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../features/insert_contact.dart';

class ReadyWidget extends StatefulWidget {
  const ReadyWidget({super.key});

  @override
  State<ReadyWidget> createState() => _ReadyWidgetState();
}

class _ReadyWidgetState extends State<ReadyWidget> {
  final contactProvider = Get.put(ContactProvider());
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    await contactProvider.loadContact(); // Ensure this updates contact list
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final contacts = contactProvider.contact;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (contacts.isEmpty) {
      return const Center(
        child: Text('Ready!', style: TextStyle(color: Colors.white, fontSize: 20)),
      );
    }

    return Container(
      color: Colors.black87,
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(
              '${contact.root}${contact.phone}',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
