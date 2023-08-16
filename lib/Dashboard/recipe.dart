import 'package:flutter/material.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'buildTile/recipe page.dart';

RecipeList list=  RecipeList();

class recipe extends StatefulWidget {
  int index;
  recipe(this.index);
  @override
  State<recipe> createState() => _recipeState();
}

class _recipeState extends State<recipe> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

backgroundColor: Color(0xFFFCFCFC),
      body:Container(


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

              return Padding(
                padding: const EdgeInsets.only(left:0,right: 0, top : 0,bottom:0),
                child: Container(

                  child: recipepage( recipeObjects[widget.index].title,
                      recipeObjects[widget.index].image_path,
                    recipeObjects[widget.index].ingredients,
                    recipeObjects[widget.index].message,
                    recipeObjects[widget.index].procedure,widget.index
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
