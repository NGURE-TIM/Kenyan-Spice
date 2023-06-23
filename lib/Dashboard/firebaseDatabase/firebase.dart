import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Recipe {

late int? id;
late String? image_path;
late String? meal_type;
late    String? title;
Recipe(this.id,this.image_path,this.meal_type,this.title);

Recipe.fromMap(Map<String , dynamic>data){
  id=data['id'];
  image_path=data['image_path'];
  meal_type=data['meal_type'];
  title=data['title'];
}


      }




      class RecipeList{
List getRecipes=[];

  Future getRecipedocument() async{



    CollectionReference collection = FirebaseFirestore.instance.collection('recipe');
    QuerySnapshot snapshot = await collection.get();

    for (QueryDocumentSnapshot snap in snapshot.docs) {
      snap.data()==null?print("error error"): print(snap.data());
      Recipe first = Recipe.fromMap(snap.data()as Map<String,dynamic>);
      print(first.image_path);
      print(first.title);
      print(first.id);
      print(first.meal_type);

      getRecipes.add(first);
      print("Number of recipes is now: ${getRecipes.length}");
    }

    }

    Future<String> getfirstrecipe ( )async{
    if (getRecipes.isEmpty)
      {
        await getRecipedocument();

      }

for(Recipe recipe in getRecipes)
  {
    recipe.image_path==null?print("eggs"):print("hey");
  }

String title=getRecipes[0].image_path;

    return title;
    }

      }



