import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:floor/floor.dart';

import 'package:east_african_spice/Dashboard/database/database_model/entities.dart';
import'package:east_african_spice/Dashboard/database/database_model/dao.dart';

part 'database.g.dart';
 // the generated code will be there

@Database(version: 1, entities: [Recipe, Ingredients])
abstract class AppDatabase extends FloorDatabase {
  RecipeDao get recipeDao;
  IngredientsDao get ingredientsDao;
}