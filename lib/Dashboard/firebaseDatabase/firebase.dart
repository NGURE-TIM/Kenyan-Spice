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
          int counter=-1;
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
    counter++;
  }
  getRecipes[counter].title;
}
catch(e){
  print(e);
}
return getRecipes;
    }

/*
Future<List<Recipe>> getRecipe() async {
    int counter=-1;
  if (getRecipes.isEmpty) {
    await getRecipedocument();
    counter++;
  }
  print('hi tim');
  print(getRecipes[counter].title);
  return getRecipes;
}

*/

      }



