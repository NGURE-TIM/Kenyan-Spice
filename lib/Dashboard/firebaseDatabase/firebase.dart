import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
int id;
String image_path;
String meal_type;
String title;

Recipe(this.id,this.image_path,this.meal_type,this.title);
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
      Recipe recipeObject = Recipe(id, image_path, meal_type, title );
      getRecipes.add(recipeObject);
      print('error first ${getRecipes.length}');
    }

  }
  catch(e){
    print(e);
  }
}
return getRecipes;
    }
}



