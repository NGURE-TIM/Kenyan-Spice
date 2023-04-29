import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/onboarding_Screens/components/widgets.dart';
import 'package:east_african_spice/onboarding_Screens/login.dart';

class Decoration{
  static BoxDecoration deco=BoxDecoration(
    image : DecorationImage(
      image:backgroundImage,
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.1),
        BlendMode.darken,
      ),
    ),
  );
}

class Welcome extends StatelessWidget {
  static const String id = "/";
  BoxDecoration backgroundDecoration =Decoration.deco;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width:screenSize.width,
        height: screenSize.height,
        decoration:backgroundDecoration ,
         child:Column(
           children: [

             Expanded(

                 child:Logoimage(250,250),
               ),


             Expanded(
               child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     height:140,
                   ),
                   login_signupButton("Get started",(){
                     Navigator.pushNamed(context, login.id);
                   }),

      SizedBox(height:10 ),

                   Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text(
                         "Don't have an account? ",
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 22,
                           fontWeight: FontWeight.bold,
                         ),),
                     //  SizedBox(width: 5,),


                       Outlined_signupButton("Sign up!",(){},)
                     ],
                   ),
                   Container(
                     height: 40,
                   ),
                 ],
               ),
             ),
           ],
         ),
      ),

    );
  }
}



