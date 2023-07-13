import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import "bottomNavBar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:east_african_spice/Dashboard/firebaseDatabase/firebase.dart';
import 'dashboard_Components.dart';
import 'dashboardConsts.dart';
import 'articles.dart';
import 'categories.dart';
import 'home.dart';

RecipeList list=  RecipeList();

class dash extends StatefulWidget {

static const String id ="/dash";

  @override
  State<dash> createState() => _dashState();
}

class _dashState extends State<dash> {
  int selectedIndex=0;
  PageController? pageController;
  final CollectionReference recipes =
  FirebaseFirestore.instance.collection('recipe');
  @override
  void initState(){
    super.initState();
    pageController=PageController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: pageController,
        onPageChanged:  (int index){
          setState(() {
            selectedIndex=index;
          });
        }        ,
        children: [
          home(),
          articles(),
          category()
        ],
      ),
      ,
    );
  }
}



























































































































































/*
          FutureBuilder(
              future: list.getfirstrecipe(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot)
              {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  String? title = snapshot.data;
                  return  Text(
                            title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  );
                } else {
                  return Text('No recipe found');
                }
              },




          )



*/