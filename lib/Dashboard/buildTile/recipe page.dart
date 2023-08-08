import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


Widget recipepage(
    String title,
    String image_path,
    List<String> ingredients,
    String message,
   List<String> procedure,
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

      return SingleChildScrollView(
        child: Column(
          children: [
            LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
             return Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height:MediaQuery.of(context).size.height-450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(convertedUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios,
                                  color: Colors.white),
                              onPressed: () {},
                            ),
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
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
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 1),
                            image: DecorationImage(
                              image: AssetImage("images/Screenshot_20230808_100855.png"),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
                            ),
                          ),
                          width: MediaQuery.of(context).size.width-30,
                          child: Padding(
                            padding: const EdgeInsets.only(left:10,right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

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
                                SizedBox(
                                  height: 2,
                                ),
                                Divider(
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height:5,
                                ),
                                buildBulletListText(ingredients[0]),
                                buildBulletListText(ingredients[1]),
                                buildBulletListText(ingredients[2]),
                                buildBulletListText(ingredients[3]),
                                buildBulletListText(ingredients[4]),
                                buildBulletListText(ingredients[5]),
                                buildBulletListText(ingredients[6]),
                                buildBulletListText(ingredients[7]),
                                buildBulletListText(ingredients[8]),
                                buildBulletListText(ingredients[9]),
                                buildBulletListText(ingredients[10]),
                                buildBulletListText(ingredients[11]),
                                buildBulletListText(ingredients[12]),
              buildBulletListText(ingredients[13]),

                                SizedBox(
                                  height: 20,
                                ),

                                Text(
                                  "Cooking Instructions",
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
                                SizedBox(
                                  height: 2,
                                ),
                                Divider(
                                  color:Colors.black,
                                ),
                                SizedBox(
                                  height:5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[0]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[1]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[2]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[3]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[4]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[5]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[6]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[7]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[8]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[9]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[10]),

                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: process(procedure[11]),

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
              }
            ),
          ],
        ),
      );
    },
  );
}

Text process(String procedure) {
  return Text(
    procedure,
    style: TextStyle(
      fontSize: 10.0,
      color: Colors.black,
      fontFamily: 'RobotoMono',
    ),
  );
}

Widget buildBulletListText(String text) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\u2022', // Unicode for bullet point
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13),
          ),
        ),
      ],
    ),
  );
}
