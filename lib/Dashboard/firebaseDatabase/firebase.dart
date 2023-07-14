import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Recipe {

int id;
String image_path;
String meal_type;
String title;
Recipe(this.id,this.image_path,this.meal_type,this.title);
      }


      class RecipeList{
List getRecipes=[];



  Future getRecipedocument() async{
try {
  CollectionReference collection = FirebaseFirestore.instance.collection("recipe");



    // = await collection.doc("x2zMgg3ucIa33j2gAo0L" )
  QuerySnapshot snapshot = await collection.get();
  /*
snapshot.docs.forEach((recipe) {
  print("in for in loop");
  int id = recipe["id"];
  String image_path = recipe["image_path"];
  String meal_type = recipe["meal_type "];
  String title = recipe["title"];
  print(image_path);
  print(meal_type);
  print(title);
  print(id);
  Recipe recipeObject = Recipe(id, image_path, meal_type, title);
  print(recipeObject);
  getRecipes.add(recipeObject);
});
*/

  for ( DocumentSnapshot  recipe in snapshot.docs) {
    recipe.exists? print("in for in loop"):print("errors");
    int id = recipe.get("id");
    String image_path = recipe.get('image_path');
    String meal_type = recipe.get('meal_type');
    String title = recipe.get('title');
    print(image_path);
    print(meal_type);
    print(title);
    print(id);
    Recipe recipeObject = Recipe(id, image_path, meal_type, title);
    getRecipes.add(recipeObject);
  }
}

catch(e){
  print(e);
}

    }

    Future<String> getfirstrecipe ()async{
    print("tim");
    if (getRecipes.length==0)
      {
        await getRecipedocument();
      }
    String title= getRecipes[0].title;
    Reference storageReference = FirebaseStorage.instance.ref().child(title);
    String imageurl = await storageReference.getDownloadURL();
    return imageurl;
    }

      }



