import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Widget recipepage(
    String title,
    String image_path,
    List<String> ingredients,
    String message,
    String procedure,
    ) {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  firebase_storage.Reference ref = storage.refFromURL(image_path);
  return FutureBuilder<String>(
    future: ref.getDownloadURL(),
    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(
          color: Colors.white,
        );
      }
      String convertedUrl = snapshot.data!;
      return Column(
        children: [
          Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: NetworkImage(convertedUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Colors.orangeAccent),
                  onPressed: () {},
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    // Implement your favorite button functionality here
                  },
                ),
              ],
            ),
          ),
          Container(
          margin: EdgeInsets.only(top:0),
            decoration: BoxDecoration(
              color: Colors.blue,
             // borderRadius: BorderRadius.circular(0),
            ),
            width: 400,
            height: 800,
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
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
                  height: 20,
                ),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                Text(ingredients[0]),
                Text(ingredients[1]),
                Text(ingredients[2]),
                Text(ingredients[3]),
                Text(
                  "Procedure",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      procedure,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        fontFamily: 'RobotoMono',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
