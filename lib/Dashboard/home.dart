import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'dashboard_Components.dart';
import 'dashboardConsts.dart';
import 'package:east_african_spice/Dashboard/buildtile.dart';
RecipeList list=  RecipeList();
class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:buildAppBar(),
      body: buildSingleChildScrollView(),
    );
  }
}
Widget buildSingleChildScrollView() => SingleChildScrollView(


  child: Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing,
        const   Text(
          "Hello, xxxxxx!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        verticalSpacing,
        const Text(
          "What would you like,",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        verticalSpacing,
        const Row(
          children: [
            Text(
              "to cook",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "today?",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(yellowTheme),
              ),
            ),


          ],
        ),
        verticalSpacing,

        verticalSpacing,
        buildRow("Popular Recipes",AnimatedEmojis.fire ),
        verticalSpacing,

        FutureBuilder <List<Recipe>>(
          future: list.getRecipe(),
          builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List recipeObjects = snapshot.data! as List;

              return SizedBox(
                  width: 320,
                  height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:recipeObjects.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTile(
                          recipeObjects[index].meal_type,
                          recipeObjects[index].title,
                          recipeObjects[index].image_path
                        ),
                      );
                    }
                ),
              );
            } else {
              return Text('No recipe found');
            }
          },
        ),
        verticalSpacing ,
        buildRow("Vegan options",AnimatedEmojis.plant ),
        verticalSpacing ,
        Container(
            height:150,
            child:  SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                Row(
                  children: [
                  ],
                )

            )),

      ],
    ),
  ),
);







AppBar buildAppBar() => AppBar(
  backgroundColor:Colors.white ,
  elevation: 0,
  leading: IconButton(
    icon: const Icon(
      Icons.menu,
      color: Color(yellowTheme),


    ), onPressed: () {
    //pull down a drawer
  },

  ),

);


/**/






