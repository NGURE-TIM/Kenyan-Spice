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
      print(snap.data());
      Recipe first = Recipe.fromMap(snap.data()as Map<String,dynamic>);
      print(first.image_path);
      getRecipes.add(first);
      for(Recipe recipe in getRecipes){
        print(recipe);
      }
    }

    }

    Future<String> getfirstrecipe ( )async{
    if (getRecipes.length==0)
      {
        await getRecipedocument();

      }

    String title=  getRecipes.length!=0?getRecipes[0].title:'empty';
    return title;
    }

      }



