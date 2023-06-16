
/*
import 'database_model/entities.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBhelper{

  static final _databaseName="recipe.db";
  static final _databaseVersion=1;

  static final columnrecipeid='recipe_id';
  static final columnimage_path='recipeimage_path';
  static final columntitle='recipetitle';
  static final columnshort_description='recipeshort_description';
  static final columnmeal_type='recipemeal_type';
  static final String recipeTable = "Recipe";


  static final Ingredientstable = 'ingredients';
  static final columningredientsid = 'ingredients_id';
  static final columncategory = 'category';
  static final columnitems = 'items';





  DBhelper._privateConstructor();
  static final DBhelper instance= DBhelper._privateConstructor();

  static late Database _database;

  Future<Database?> getDatabase() async {
    if (_database != null) {
      return _database;
    }
    _database = (await _initDatabase())!;
    return _database;
  }
  //this opens the database (and creates it if it doesn't exist)
  Future <Database?>_initDatabase () async {

    String path=join( await getDatabasesPath(),
        _databaseName
    );
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate
    );
  }


  Future _onCreate (Database db , int version) async{
    await db.execute(
        '''
          CREATE TABLE $recipeTable (
            $columnrecipeid INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnimage_path TEXT,
            $columntitle TEXT,
            $columnshort_description TEXT,
            $columnmeal_type TEXT,

          )
          '''
    );

    await db.execute(
      //'''multiline string
        '''
          CREATE TABLE $Ingredientstable (
          $columnrecipeid INTEGER,
          $columningredientsid INTEGER ,
          $columncategory  TEXT,
          $columnitems TEXT,
          FOREIGN KEY (recipe_id) REFERENCES $recipeTable ($columnrecipeid)
          )
         '''

    );
  }

  Map<String, dynamic> _recipeToMap(Recipe recipe){
    return{
      columnrecipeid: recipe.recipe_id,
      columnimage_path: recipe.image_path,
      columntitle: recipe.title,
      columnshort_description: recipe.short_description,
      columnmeal_type: recipe.meal_type,
    };
  }

  Recipe _mapToRecipe(Map<String, dynamic> map) {
    return Recipe(
      recipe_id: map[columnrecipeid],
      image_path: map[columnimage_path],
      title: map[columntitle],
      short_description: map[columnshort_description],
      meal_type: map[columnmeal_type],
    );
  }

  // Convert an Ingredient object to a Map<String, dynamic>
  Map<String, dynamic> _ingredientToMap(Ingredients ingredient) {
    return {
      columnrecipeid: ingredient.recipe_id,
      columningredientsid: ingredient.ingredients_id,
      columncategory: ingredient.category,
      columnitems: ingredient.item,
    };
  }

  // Convert a database row (Map<String, dynamic>) to an Ingredient object
  Ingredients _mapToIngredient(Map<String, dynamic> map) {
    return Ingredients(
      recipe_id: map[columnrecipeid],
      ingredients_id: map[columningredientsid],
      category: map[columncategory],
      item: map[columnitems],
    );
  }
  Future<void> insertRecipe(Recipe recipe) async {
    Database? db = await getDatabase();
    await db?.insert(recipeTable, _recipeToMap(recipe));
  }

  Future<List<Recipe>> getAllRecipes() async {
    Database? db = await getDatabase();
    List<Map<String, dynamic>> results = await db?.query(recipeTable);
    return results.map((map) => _mapToRecipe(map)).toList();
  }

  Future<void> insertIngredients(int recipeId, List<Ingredients> ingredients) async {
    Database? db = await getDatabase();
    Batch? batch = db?.batch();
    for (Ingredients ingredient in ingredients) {
      batch.insert(Ingredientstable, _ingredientToMap(ingredient, recipeId));
    }
    await batch.commit();
  }

  Future<List<Ingredients>> getIngredientsForRecipe(int recipeId) async {
    Database? db = await getDatabase();
    List<Map<String, dynamic>> results = await db?.query(
      Ingredientstable,
      where: '$columnrecipeid = ?',
      whereArgs: [recipeId],
    );
    return results.map((map) => _mapToIngredient(map)).toList();
  }




}





















import 'package:east_african_spice/Dashboard/database/databasehelper.dart';
import 'package:sqflite/sqflite.dart';
class Recipe{
 final  int recipe_id;
 final String image_path;
 final String title;
 final String short_description;
 final String meal_type;
Recipe(

 {
   required this.recipe_id,
   required this.image_path,
   required this.title,
   required this.short_description,
   required this.meal_type,

});
 //Convert a Recipe object to a Map<String, dynamic>


}
class Ingredients{
  final int ingredients_id;
  final  int recipe_id;
  final String category;
  final String item;
  Ingredients(

      {
        required this.recipe_id,
        required this.ingredients_id,
        required this.category,
        required this.item,

      });
}*/







