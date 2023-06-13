import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Database> createDatabase() async {
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'recipes.db');

  return await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE recipes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          ingredients TEXT,
          instructions TEXT
        )
      ''');
    },
  );
}

void insertRecipe(Database database, String name, String ingredients, String instructions) async {
  await database.insert(
    'recipes',
    {
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
    },
  );
}

Future<List<Map<String, dynamic>>> getRecipes(Database database) async {
  return await database.query('recipes');
}
void main() async {
  final database = await createDatabase();

  // Insert a recipe
  insertRecipe(database, 'Spaghetti Bolognese', 'Ingredients...', 'Instructions...');

  // Query all recipes
  final recipes = await getRecipes(database);
  recipes.forEach((recipe) {
    print('Name: ${recipe['name']}');
    print('Ingredients: ${recipe['ingredients']}');
    print('Instructions: ${recipe['instructions']}');
  });
}







