import 'package:flutter/material.dart';
Widget buildTile( String meal_type, String title)
{
return

  Container(
    padding:EdgeInsets.all(12),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(12),
  color: Colors.blue,
  ),
  child:Column(
  children: [
  Container(
  height: 100,
  width: 100,
  child: Image.asset("images/black.png")),
    Text(
      title,
      style:TextStyle(

          color: Colors.orangeAccent,
      fontWeight: FontWeight.bold

      )
      ),
    Text(
       meal_type,
        style:TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold

        ),
    )

      ],
    ) ,
  );
}