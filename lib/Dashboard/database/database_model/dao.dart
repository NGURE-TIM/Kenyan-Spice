
/*
import 'package:floor/floor.dart';
import 'package:east_african_spice/Dashboard/database/database_model/entities.dart';

@dao

abstract class RecipeDao{
 @Query("SELECT * FROM RECIPE") 
  Future<List<Recipe>> getAllRecipes();
 @Insert(onConflict: OnConflictStrategy.replace)
 Future<void> insertRecipe(Recipe recipe);
  
}

@dao
abstract class IngredientsDao {
  @Query('SELECT * FROM ingredient')
  Future<List<Ingredients>> getAllIngredients();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertIngredients(Ingredients ingredients);
}
*/