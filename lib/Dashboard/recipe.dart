import 'package:flutter/material.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'buildTile/recipe page.dart';

RecipeList list=  RecipeList();

favouriteRecipeList favouritelist=favouriteRecipeList();
veganRecipeList veganlist=veganRecipeList();

class recipe extends StatefulWidget {
  int index;
  List filter;
  recipe(this.index , this.filter);
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


        child: Padding(
          padding: const EdgeInsets.only(left:0,right: 0, top : 0,bottom:0),
          child: Container(

            child: recipepage( widget.filter[widget.index].title,
                widget.filter[widget.index].image_path,
                widget.filter[widget.index].ingredients,
                widget.filter[widget.index].message,
                widget.filter[widget.index].procedure,widget.index
            ),
          ),
        )
      ),
    )
    );
  }
}


class favourite extends StatefulWidget {
int index;
favourite(this.index);

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(

      backgroundColor: Color(0xFFFCFCFC),
      body:Container(


        child: FutureBuilder <List<favouriteRecipe>>(
          future: favouritelist.getRecipe(),
          builder: (BuildContext context, AsyncSnapshot<List<favouriteRecipe>> snapshot)
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


class vegan extends StatefulWidget {

  int index;
  vegan(this.index);
  @override
  State<vegan> createState() => _veganState();
}

class _veganState extends State<vegan> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:
    Scaffold(

      backgroundColor: Color(0xFFFCFCFC),
      body:Container(


        child: FutureBuilder <List< veganRecipe>>(
          future: veganlist.getRecipe(),
          builder: (BuildContext context, AsyncSnapshot<List<veganRecipe>> snapshot)
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
