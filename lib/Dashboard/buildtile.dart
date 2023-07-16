import 'package:flutter/material.dart';


class Tile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: list.getfirstrecipe(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot)
      {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          String? title = snapshot.data;
          return Container(
            padding:EdgeInsets.all(12),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black,
            ),
            child:Column(
              children: [
       Container(
         height: 50,
           width: 50,
           child: Image.asset("images/black.png")),
                Text(

                )



              ],
            ) ,

          );
        } else {
          return Text('No recipe found');
        }
      },
    );
  }
}


