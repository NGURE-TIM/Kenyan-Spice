import 'package:cloud_firestore/cloud_firestore.dart';
class Recipe {
int id;
String image_path;
String meal_type;
String title;
String ingredients;
String description;
Recipe(this.id,this.image_path,this.meal_type,this.title,this.description,this.ingredients);
      }
      class RecipeList{
List getRecipes=[];
  Future getRecipedocument() async{
try {
  CollectionReference collection = FirebaseFirestore.instance.collection('recipe');
  QuerySnapshot snapshot = await collection.get();

  for (QueryDocumentSnapshot recipe in snapshot.docs) {
    print("in for in loop");
    int id = recipe.get('id');
    String image_path = recipe.get('image_path');
    String meal_type = recipe.get('meal_type');
    String title = recipe.get('title');
    String ingredients=recipe.get('ingredients');
    String description=recipe.get(' description');
    Recipe recipeObject = Recipe(id, image_path, meal_type, title, description,ingredients );
    getRecipes.add(recipeObject);
  }
}
catch(e){
  print(e);
}
    }

    Future<List?> getfirstrecipe ()async{

    if (getRecipes.length==0)
      {
        await getRecipedocument();
      }
    for ( Recipe myRecipe in getRecipes ){


    }

    return ;

    }
      }



