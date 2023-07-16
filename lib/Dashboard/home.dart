import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'dashboard_Components.dart';
import 'dashboardConsts.dart';

import 'package:firebase_cached_image/firebase_cached_image.dart';

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
        Row(
          children: [
            buildSearchbar(),
            const SizedBox(
              width: 10,
            ),
            const  IconButton(
              onPressed: null, icon: Icon(Icons.filter_alt ),
              iconSize: 30,
            ),

          ],
        ),

        verticalSpacing,
        buildRow("Popular Recipes",AnimatedEmojis.fire ),
        verticalSpacing,

        Container(
            height:150,
            child:SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:null


            )),
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









