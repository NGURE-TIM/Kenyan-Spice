import 'package:flutter/material.dart';
import'package:east_african_spice/Dashboard/recipe.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
Widget buildTile( String meal_type, String title , String image_path , int index , List type)
{
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  firebase_storage.Reference ref = storage.refFromURL(image_path);
return
  FutureBuilder<String>(
      future: ref.getDownloadURL(),
  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator(
        color: Colors.white,
      );
    }
    String convertedUrl = snapshot.data!;
    return
      GestureDetector(
        onTap:(){
          if (type=='favouriteObjects')
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => favourite(index)),
            );
          }
         else{

          }

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => vegan(index)),
          );
        },
        child: Container(
          height: 100,
          width: 180,
          padding: EdgeInsets.only(left: 8, right: 30),
          decoration:
          BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(convertedUrl),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1),
                BlendMode.darken,
              ),
            ),

            borderRadius: BorderRadius.circular(8),
          ),

          child: Column(
            children: [

              SizedBox(
                height: 170,
              ),


              Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.only(top: 15, left: 9),
                decoration:
                BoxDecoration(
                  color: Colors.white,
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
                        fontSize:9 , // Adjust the font size as needed
                        fontWeight: FontWeight.w900,
                        color: Colors.black87,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 2),
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
          ),
        ),
      );
  }
  );
}


