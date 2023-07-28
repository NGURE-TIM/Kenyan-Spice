import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
Widget griditem( String meal_type, String title , String image_path)
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
           Container(
             height: 400,
             width: 200,
             decoration: BoxDecoration(
              color: Colors.white,
               borderRadius: BorderRadius.all(Radius.circular(20.0)),
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey.withOpacity(0.3),
                   offset: Offset(0, 4),
                   blurRadius:1,
                   spreadRadius: 0.5,
                 ),
               ],
             ),

             child:Column(

               children: [
                 SizedBox(
                   height: 20,
                   width: 20,
                 ),
               SizedBox(
                 height: 100,
                 width: 100,
                 child: ClipOval(
                   child: Image.network(
                   convertedUrl,
                   fit: BoxFit.cover,
                   color: Colors.black.withOpacity(0.1),
                   colorBlendMode: BlendMode.darken,
             ),
                 ),
               ),
                 Text(
                   title,
                   style: TextStyle(
                     fontSize: 11, // Adjust the font size as needed
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
           );
        }
    );
}