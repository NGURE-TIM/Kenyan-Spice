import 'package:animated_emoji/animated_emoji.dart';
import 'package:east_african_spice/Dashboard/recipe.dart';
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'buildTile/buildtile.dart';
import 'dashboard_Components.dart';
import 'dashboardConsts.dart';

favouriteRecipeList list=favouriteRecipeList();
veganRecipeList veganlist=veganRecipeList();
class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:buildAppBar( context),
      drawer:buildDrawer(context),
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
          "Hello, welcome to spice !",
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
const SizedBox(
  width: 70,
),
/*buildSearchbar(),*/
        verticalSpacing,
        buildRow("Popular Recipes",AnimatedEmojis.fire ),
        verticalSpacing,

        FutureBuilder <List<favouriteRecipe>>(
          future: list.getRecipe(),
          builder: (BuildContext context, AsyncSnapshot<List<favouriteRecipe>> snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List favouriteObjects = snapshot.data! as List;
String i ='favouriteObjects';
              return SizedBox(
                  width: 320,
                  height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:favouriteObjects.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTile(
                          favouriteObjects[index].meal_type,
                          favouriteObjects[index].title,
                          favouriteObjects[index].image_path,
                          index,i
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

        FutureBuilder <List<veganRecipe>>(
          future: veganlist.getRecipe(),
          builder: (BuildContext context, AsyncSnapshot<List<veganRecipe>> snapshot)
          {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              List veganObjects = snapshot.data! as List;
              String i ='veganObjects';
              return SizedBox(
                width: 320,
                height: 250,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:veganObjects.length,
                    itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: buildTile(
                          veganObjects[index].meal_type,
                          veganObjects[index].title,
                          veganObjects[index].image_path,
                          index ,i
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

      ],
    ),
  ),
);







AppBar buildAppBar(BuildContext context) => AppBar(
  backgroundColor:Colors.white ,
  elevation: 0,
  leading: IconButton(
    icon: const Icon(
      Icons.menu,
      color: Color(yellowTheme),


    ), onPressed: () {
    Scaffold.of(context).openDrawer();
  },

  ),

);

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        // Add items to your drawer here
        ListTile(
          title: Text('Item 1'),
          onTap: () {

          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {

          },
        ),
        // Add more items as needed
      ],
    ),
  );
}





Container buildSearchbar() {
  return Container(
    width: 250,
    height: 40,
    child: const TextField(
        style: TextStyle(
          color:Colors.white,
        ),
        cursorColor: Color(yellowTheme),
        textAlign: TextAlign.left,
        onChanged:null,
        decoration: InputDecoration(

          prefixIcon: Padding(
              padding: EdgeInsets.only(right:5,left: 10),

              child:IconButton(
                color: Colors.grey,
                icon: Icon(
                    Icons.search
                ),
                onPressed: null,
              )

          ),

          filled: true,
          fillColor: Colors.white70,

          hintText: "Search recipes",

          hintStyle: TextStyle(

            color: Colors.black,

          ),

          contentPadding: EdgeInsets.symmetric(
              vertical: 10.0, horizontal: 20.0),

          border:

          OutlineInputBorder(

            borderRadius: BorderRadius.all(Radius.circular(32.0)),

          ),

          enabledBorder: OutlineInputBorder(

            borderSide: BorderSide(
                color: Color(yellowTheme), width: 1.0),

            borderRadius: BorderRadius.all(Radius.circular(32.0)),

          ),

          focusedBorder: OutlineInputBorder(

            borderSide: BorderSide(
                color: Color(yellowTheme), width: 2.0),

            borderRadius: BorderRadius.all(Radius.circular(32.0)),

          ),

          // cursorColor: Color,

        )
    ),
  );
}


