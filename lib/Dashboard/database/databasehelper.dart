import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  factory DatabaseHelper() {
    if (_instance == null) {
      _instance = DatabaseHelper._();
    }
    return _instance!;
  }

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }

  DatabaseHelper._();

  Future<Database?> initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String databasePath = join(databasesPath, 'recipes.db');
    bool databaseExists = await checkIfDatabaseExists(databasePath);

    if (!databaseExists) {
      await copyDatabaseFromAssets(databasePath);
    }

    return await openDatabase(databasePath);
  }

  Future<bool> checkIfDatabaseExists(String databasePath) async {
    return databaseFactory.databaseExists(databasePath);
  }

  Future<void> copyDatabaseFromAssets(String databasePath) async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    String destPath = join(documentsDirectory.path, 'recipes.db');

    ByteData? databaseByteData;
    try {
      databaseByteData = await rootBundle.load('database_assests/recipes.db');
    } catch (e) {
      throw Exception('Failed to load prepopulated database file: $e');
    }

    try {
      final bytes = databaseByteData!.buffer.asUint8List();
      await File(destPath).writeAsBytes(bytes, flush: true);
    } catch (e) {
      throw Exception('Failed to write prepopulated database to path: $e');
    }
  }
}








