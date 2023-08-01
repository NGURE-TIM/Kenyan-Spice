import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dashboard_State management/icon_Select.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'buildTile/gridTile.dart';
import 'buildTile/recipe page.dart';

RecipeList list=  RecipeList();
int i=-1;
class recipe extends StatefulWidget {
  const recipe({super.key});

  @override
  State<recipe> createState() => _recipeState();
}

class _recipeState extends State<recipe> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      backgroundColor:Colors.white,

      body:SingleChildScrollView(

        child: FutureBuilder <List<Recipe>>(
          future: list.getRecipe(),
          builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List recipeObjects = snapshot.data! as List;
               for(Recipe recipes in recipeObjects){
                 i++;
               }

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left:0,right: 0, top : 0,bottom:0),
                  child: Container(
                    child: recipepage( recipeObjects[0].title,
                        recipeObjects[0].image_path,
                      recipeObjects[0].ingredients,
                      recipeObjects[0].message,
                      recipeObjects[0].procedure,
                    ),
                  ),
                ),
              );

            } else {
              return Text('No recipe found');
            }
          },
        ),



      ),
    )
    );
  }
}
