import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/welcome.dart';
import"package:east_african_spice/onboarding_Screens/login.dart";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute:Welcome.id ,
      routes: {
        Welcome.id:(context)=>Welcome(),
        login.id:(context)=>login(),


      },
    );
  }
}




