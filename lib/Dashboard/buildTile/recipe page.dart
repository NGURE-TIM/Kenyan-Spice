import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
Widget recipepage( String title , String image_path, String ingredients, String message, String  procedure,
    )
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
              child:Column(
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.black, // Customize the color as per your theme
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: ClipOval(
                      child: Image.network(
                        convertedUrl,
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.1),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),

                ],
              ),
            );
        }
    );
}