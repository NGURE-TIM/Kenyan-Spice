import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Widget recipepage( String title , String image_path, List<String> ingredients, String message, String  procedure,
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

                  Container(
                    width: 600,
                    height: 450,
                    decoration: BoxDecoration(
                      color:Colors.white60,
                        boxShadow: [
                    BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(2, 2), // X and Y offset to create the shadow's position
                    blurRadius: 4,        // Controls the softness of the shadow
                    spreadRadius: 0,      // No spread radius, so the shadow stays confined to the container
                  ),
                ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children: [

                            IconButton(
                                icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey
                                ),
                                onPressed: () {  },
                              ),

                                IconButton(
                                  color:Colors.grey,
                                  icon: Icon(Icons.favorite),
                                  onPressed: () {
                                   null;
                                  },
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(

                          title,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600,
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
                          height: 40,
                        ),
                        Center(
                          child: SizedBox(
                            height: 230,
                            width: 230,
                            child: ClipOval(
                              child: Image.network(
                                convertedUrl,
                                fit: BoxFit.cover,
                                color: Colors.black.withOpacity(0.1),
                                colorBlendMode: BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
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

Text(
  ingredients[0]
),
                  Text(
                      ingredients[1]
                  ),

                  Text(
                      ingredients[2]
                  ),

                  Text(
                      ingredients[3]
                  ),

                  Text(
                    "Procedure",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600,
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
                  Text(
                     procedure
                  ),

                ],
              ),
            );
        }
    );
}