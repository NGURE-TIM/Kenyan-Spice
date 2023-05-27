import 'package:east_african_spice/onboarding_Screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/welcome.dart';
import"package:east_african_spice/onboarding_Screens/login.dart";



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute:Welcome.id ,
      routes: {
        Welcome.id:(context)=>Welcome(),
        login.id:(context)=>login(),
        signUP.id:(context)=>signUP(),
      },
    );
  }
}




