import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
Widget buildTile( String meal_type, String title)
{
return
  Container(
    height: 100,
    width: 180,
    padding:EdgeInsets.only(left: 8,right: 30),
  decoration:
  BoxDecoration(

    image : DecorationImage(
      image: AssetImage("images/Rice and beans.png"),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(
        Colors.black.withOpacity(0.1),
        BlendMode.darken,
      ),
    ),

    borderRadius: BorderRadius.circular(8),
  ),

  child:Column(
  children: [

SizedBox(
  height: 170,
),



   Container(
     height: 60,
     width: double.infinity,
     padding:EdgeInsets.only(top:15,left:9),
     decoration:
     BoxDecoration(
       color:Colors.white,
       borderRadius: BorderRadius.circular(12),
       /* boxShadow: [
         BoxShadow(
           color: Colors.white,
           offset: Offset(0,1),
           blurRadius: 4,
         ),
       ],*/

     ),
     child: Column(
     mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           title,
           style: TextStyle(
             fontSize: 11, // Adjust the font size as needed
             fontWeight: FontWeight.w900,
             color: Colors.black87,
             letterSpacing: 1.2,
           ),
         ),
         SizedBox(height:2),
         Text(
           meal_type,
           style: TextStyle(
             fontSize: 9, // Adjust the font size as needed
             fontWeight: FontWeight.w900,
             color: Color(0xFFE5AD0C),
             letterSpacing: 1.2,
           ),
         )

       ],
     ),
   )

      ],
    ) ,
  );
}


/* Container(
    height: 127,
    width: 127,
    decoration: BoxDecoration(
      shape: BoxShape.circle,

    ),
    child: ClipOval(
      child:
    ),
  ),*/


/*BlurryContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 11, // Adjust the font size as needed
              fontWeight: FontWeight.w900,
              color: Colors.black87,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height:2),
          Text(
            meal_type,
            style: TextStyle(
              fontSize: 9, // Adjust the font size as needed
              fontWeight: FontWeight.w900,
              color: Color(0xFFE5AD0C),
              letterSpacing: 1.2,
            ),
          )

        ],
      ),
      blur: 9,
      width: double.infinity,
      height: 60,
      elevation:60,
      color: Colors.transparent,
      padding: EdgeInsets.only(top:15,left:9),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
    ),*/