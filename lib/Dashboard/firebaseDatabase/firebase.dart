import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
int id;
String image_path;
String meal_type;
String title;

List<String> ingredients;
String  message;
List<String>  procedure;
Recipe(this.id,this.image_path,this.meal_type,this.title,this.ingredients,this.message,this.procedure);
      }
      class RecipeList{
        List<Recipe> getRecipes=[];

        Future<List<Recipe>> getRecipe() async {
if(getRecipes.isEmpty){
  try {
    CollectionReference collection = FirebaseFirestore.instance.collection('recipe');
    QuerySnapshot snapshot = await collection.get();

    for (QueryDocumentSnapshot recipe in snapshot.docs) {
      int id = recipe.get('id');
      String image_path = recipe.get('image_path');
      String meal_type = recipe.get('meal_type');
      String title = recipe.get('title');
      List<dynamic> ingredientsDynamic = recipe.get('ingredients') as List<dynamic>;
      List<String> ingredients = ingredientsDynamic.map((ingredient) => ingredient.toString()).toList();
      String message = recipe.get('message');
      List<dynamic> procedureDynamic = recipe.get('procedure') as List<dynamic>;
      List<String> procedure = procedureDynamic.map((procedure) => procedure.toString()).toList();
      Recipe recipeObject = Recipe(id, image_path, meal_type, title, ingredients,message,procedure);
      getRecipes.add(recipeObject);
    }
  }
  catch(e){
    print(e);
  }
}
return getRecipes;
    }

}



class favouriteRecipe {
  String image_path;
  String meal_type;
  String title;
  List<String> ingredients;
  String  message;
  List<String>  procedure;
  favouriteRecipe(this.image_path,this.meal_type,this.title,this.ingredients,this.message,this.procedure);
}
class favouriteRecipeList{
  List<favouriteRecipe> getRecipes=[];

  Future<List<favouriteRecipe>> getRecipe() async {
    if(getRecipes.isEmpty){
      try {
        CollectionReference collection = FirebaseFirestore.instance.collection('favourites');
        QuerySnapshot snapshot = await collection.get();

        for (QueryDocumentSnapshot recipe in snapshot.docs) {
          String image_path = recipe.get('image_path');
          String meal_type = recipe.get('meal_type');
          String title = recipe.get('title');
          List<dynamic> ingredientsDynamic = recipe.get('ingredients') as List<dynamic>;
          List<String> ingredients = ingredientsDynamic.map((ingredient) => ingredient.toString()).toList();
          String message = recipe.get('message');
          List<dynamic> procedureDynamic = recipe.get('procedure') as List<dynamic>;
          List<String> procedure = procedureDynamic.map((procedure) => procedure.toString()).toList();
          favouriteRecipe recipeObject = favouriteRecipe(image_path, meal_type, title, ingredients,message,procedure);
          getRecipes.add(recipeObject);
        }
      }
      catch(e){
        print(e);
      }
    }
    return getRecipes;
  }

}




class veganRecipe {
  String image_path;
  String meal_type;
  String title;
  List<String> ingredients;
  String  message;
  List<String>  procedure;
  veganRecipe(this.image_path,this.meal_type,this.title,this.ingredients,this.message,this.procedure);
}
class veganRecipeList{
  List<veganRecipe> getRecipes=[];

  Future<List<veganRecipe>> getRecipe() async {
    if(getRecipes.isEmpty){
      try {
        CollectionReference collection = FirebaseFirestore.instance.collection('favourites');
        QuerySnapshot snapshot = await collection.get();

        for (QueryDocumentSnapshot recipe in snapshot.docs) {
          String image_path = recipe.get('image_path');
          String meal_type = recipe.get('meal_type');
          String title = recipe.get('title');
          List<dynamic> ingredientsDynamic = recipe.get('ingredients') as List<dynamic>;
          List<String> ingredients = ingredientsDynamic.map((ingredient) => ingredient.toString()).toList();
          String message = recipe.get('message');
          List<dynamic> procedureDynamic = recipe.get('procedure') as List<dynamic>;
          List<String> procedure = procedureDynamic.map((procedure) => procedure.toString()).toList();
          veganRecipe recipeObject = veganRecipe(image_path,meal_type, title, ingredients,message,procedure);
          getRecipes.add(recipeObject);
        }
      }
      catch(e){
        print(e);
      }
    }
    return getRecipes;
  }

}


