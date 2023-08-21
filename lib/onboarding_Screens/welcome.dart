import 'package:flutter/material.dart';
import 'package:east_african_spice/onboarding_Screens/constants/constants.dart';
import 'package:east_african_spice/onboarding_Screens/components/widgets.dart';
import 'package:east_african_spice/onboarding_Screens/login.dart';
import 'package:east_african_spice/onboarding_Screens/signup.dart';
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
SizedBox(
  height: 100,
),
             Logoimage(400,400),


             Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [

                 login_signupButton("Get started",(){
                   Navigator.pushNamed(context, login.id);
                 }),
                 SizedBox(height:12),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     SizedBox(width:10),

                     Outlined_signupButton("Sign up here !", () {
                       Navigator.pushNamed(context, signUP.id);
                     },)
                   ],
                 ),

               ],
             ),
           ],
         ),
      ),

    );
  }
}



