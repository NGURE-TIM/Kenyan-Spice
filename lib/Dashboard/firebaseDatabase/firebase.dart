import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
int id;
String image_path;
String meal_type;
String title;

String ingredients;
String  message;
String procedure;


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
      print("in for in loop");
      int id = recipe.get('id');
      String image_path = recipe.get('image_path');
      String meal_type = recipe.get('meal_type');
      String title = recipe.get('title');
      String ingredients = recipe.get('ingredients');
      String message = recipe.get('message');
      String procedure = recipe.get('procedure');
      print(procedure);
      Recipe recipeObject = Recipe(id, image_path, meal_type, title, ingredients,message,procedure);
      getRecipes.add(recipeObject);
      print('error first ${getRecipes.length}');
    }



  }
  catch(e){
    print(e);
  }
}
/////////////////////////////////////////add print function to test out length
return getRecipes;
    }
}



