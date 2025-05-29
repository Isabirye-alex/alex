// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../pages/contact.dart';
//
// class PhoneNumber {
//   static Database? _database;
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('tasks_db.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (db, version) {
//         return db.execute('''
//           CREATE TABLE tasks (
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             contact TEXT NULL,
//             createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
//           )
//         ''');
//       },
//     );
//   }
//
//   Future<void> insertContact(Contact contact) async {
//     final db = await database;
//     await db.insert('contacts', contact.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
//   }
//
//   Future<List<Contact>> getContact() async {
//     final db = await database;
//     final result = await db.query('contacts', where: 'contact = ?', whereArgs: []);
//     return result.map((map) => Contact.fromMap(map)).toList();
//   }
//
// }
