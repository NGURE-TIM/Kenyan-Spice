import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


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
  CollectionReference collection = FirebaseFirestore.instance.collection('recipe');
  QuerySnapshot snapshot = await collection.get();

  for (QueryDocumentSnapshot recipe in snapshot.docs) {
    print("in for in loop");
    int id = recipe.get('id');
    String image_path = recipe.get('image_path');
    String meal_type = recipe.get('meal_type');
    String title = recipe.get('title');
    print(image_path);
    print(meal_type);
    print(title);
    print(id);
    Recipe recipeObject = Recipe(id, image_path, meal_type, title);
    print(recipeObject);
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
    String title= getRecipes[0]. image_path;
    return title;
    }

      }



