import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../pages/contact.dart';
import 'package:get/get.dart';
class PhoneNumber {
  static PhoneNumber get instance => Get.find();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('contacts_db.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE contacts (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            phone TEXT NOT NULL,
            root TEXT NOT NULL,
            createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
          )
        ''');
      },
    );
  }

  Future<void> insertContact(Contact contact) async {
    final db = await database;
    final map = contact.toMap();
    print('Inserting contact: $map');
    await db.insert(
      'contacts',
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> getContact() async {
    final db = await database;
    final result = await db.query('contacts');
    print('Contacts fetched from DB: $result');
    return result.map((map) => Contact.fromMap(map)).toList();
  }
}
