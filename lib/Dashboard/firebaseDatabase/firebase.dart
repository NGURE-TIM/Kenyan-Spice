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

    CollectionReference collection = FirebaseFirestore.instance.collection('recipe');
    QuerySnapshot snapshot = await collection.get();

      for (QueryDocumentSnapshot recipe in snapshot.docs ){
        int id =recipe.get('id');
        String image_path =recipe.get('image_path');
        String meal_type =recipe.get('meal_type');
        String title =recipe.get('title');
        Recipe recipeObject=Recipe(id, image_path, meal_type, title);
        getRecipes.add(recipeObject);
      }
    }

    Future<String> getfirstrecipe ()async{
    if (getRecipes.length==0)
      {
        await getRecipedocument();
      }
    String title=  getRecipes[0].title;
    return title;
    }

      }



