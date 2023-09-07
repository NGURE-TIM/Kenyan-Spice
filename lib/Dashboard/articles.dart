
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'dashboard_State management/icon_Select.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';

import 'buildTile/gridTile.dart';
RecipeList list=  RecipeList();
  class articles extends StatefulWidget {
    @override
    State<articles> createState() => _articlesState();
  }

  class _articlesState extends State<articles> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(

        backgroundColor: Colors.white,
        body:MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>Select())
          ],
          child: SafeArea(
            child: Column(

              children: [
                Container(
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/young-pleased-afro-american-cook-chef-uniform-stands-white-wall-looks-wall-isolated-orange-wall.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1),
                        BlendMode.darken,
                      ),
                    ),

                    borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20), ),
                  ),
                  height: 250,
                  width: double.infinity,
                  child:Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        Text("Find your ",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(2, 2), // Horizontal and vertical offset of the shadow
                          blurRadius: 4, // The blur radius of the shadow
                        ),
                      ],
                    ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("favourite ",
                            style: TextStyle(
                              fontSize: 23,
                              color: Color(yellowTheme),
                              fontWeight: FontWeight.w900,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  offset: Offset(2, 2), // Horizontal and vertical offset of the shadow
                                  blurRadius: 4, // The blur radius of the shadow
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        Text("recipes ",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              shadows: [
                                Shadow(
                                  color: Colors.grey,
                                  offset: Offset(2, 2), // Horizontal and vertical offset of the shadow
                                  blurRadius: 4, // The blur radius of the shadow
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("in a Tap! ",
                            style: TextStyle(
                              fontSize:32,
                              color: Color(yellowTheme),
                              fontWeight: FontWeight.w900,
                              shadows: [
                                Shadow(
                                  color: Colors.black45,
                                  offset: Offset(2, 2), // Horizontal and vertical offset of the shadow
                                  blurRadius: 4, // The blur radius of the shadow
                                ),
                              ],
                            ))
                      ],
                    ),
                  )
                ),
                   SizedBox(height: 10,),
                Consumer<Select>(
                builder:(context,selectProviderModel,child)=>
        Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildSelect(FontAwesomeIcons.bowlRice, "main meal",selectProviderModel.Status1 , 1),
                      SizedBox(
                        width: 12,
                      ),
                      buildSelect(FontAwesomeIcons.bowlFood, "one pot" , selectProviderModel.Status2 ,2 ) ,
                      SizedBox(
                        width: 5,
                      ),
                      buildSelect(FontAwesomeIcons.burger, "snack", selectProviderModel.Status3 , 3 ),
                    ],
                  ),
                ),
      Consumer<Select>(
      builder:(context,selectProviderModel,child)=> FutureBuilder <List<Recipe>>(
        future: list.getRecipe(),
        builder: (BuildContext context, AsyncSnapshot<List<Recipe>> snapshot)
        {
        if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
        } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
        List recipeNotation = snapshot.data!;
        List filtered = [];
        print(selectProviderModel.selectedMealType);
        for (Recipe x in recipeNotation)
        {
        if(x.meal_type==selectProviderModel.selectedMealType)
        {
        filtered.add(x);
        }
        }

        return Expanded(
        child: Padding(
        padding: const EdgeInsets.only(left:30,right: 30, top : 5,bottom: 15),
        child: Container(
        child: GridView.builder(
        physics: BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 2/2.5,
        crossAxisSpacing: 5,
        mainAxisSpacing: 10),
        itemCount:    filtered.length,
        itemBuilder: (BuildContext ctx, index) {
        return
                        griditem(filtered[index].meal_type,
                            filtered[index].title,
                            filtered[index].image_path,index,filtered);

        }),
        ),
        ),
        );

        } else {
        return Text('No recipe found');
        }
        },
        ),
      ),

SizedBox(height: 20,),
              ]
                ) ,


            ),
        ),
        );

    }

   buildSelect(IconData type ,String mealtype, bool Status , int buttonNUm ) =>
        Consumer<Select>(
            builder:(context,selectProviderModel,child)=>
       Column(
         children: [
           GestureDetector(
                onTap: (){
                  selectProviderModel.getStatus(buttonNUm);
                  selectProviderModel.buildGrid(mealtype);
                  },
                child: Container(
                  height:40 ,
                    width:95 ,
                  decoration:  BoxDecoration(
color: Status? Colors.white:Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(90)
                  ),
child:  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    FaIcon(type,
                size: 18,
                color: Status? Colors.black: Colors.white60,
    ),
    SizedBox(width: 4,),
    Text(
                mealtype,
      style: TextStyle(
              color: Status? Colors.orangeAccent:Colors.black ,
                fontSize:10,
                fontWeight: FontWeight.w900,
      ),
    )
  ],
),

                ),
              ),

         ],
       ),
        );
    }
















