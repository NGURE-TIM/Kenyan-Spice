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
}
