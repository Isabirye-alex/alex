// import 'package:africa/pages/contact.dart';
// import 'package:flutter/material.dart';
// import 'package:africa/database/store_contact.dart';
//
// class ContactProvider with ChangeNotifier {
//   final List<Contact> _contacts = [];
//   final taskDatabase = PhoneNumber();
//   List<Contact> get contact => _contacts;
//
//   void addTask(String phone) async {
//     final newContact = Contact(
//       phone: phone,
//       id: id
//     );
//     await taskDatabase.insertContact(newContact);
//     _contacts.add(newContact);
//     final allContacts = await PhoneNumber.ge;
//     _tasks.clear();
//     _tasks.addAll(allTasks);
//     notifyListeners();
//   }
//
//
//   Future<void> loadContact() async {
//     final fetchedTasks = await taskDatabase.getContact();
//     _tasks.clear();
//     _tasks.addAll(fetchedTasks);
//     notifyListeners();
//   }
// }
