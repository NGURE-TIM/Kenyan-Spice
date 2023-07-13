import 'package:flutter/material.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:animated_emoji/emojis.dart';
//the below builds a row for homepage running headers
class buildRow extends StatelessWidget {
  String title;
  AnimatedEmojiData emojiType;
  buildRow(this.title,this.emojiType);
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        AnimatedEmoji(
          emojiType,
          size: 25,
        ),
      ],

    );
  }
}


/*FutureBuilder(
              future: list.getfirstrecipe(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot)
              {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  String? title = snapshot.data;
                  return  Text(
                            title!,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  );
                } else {
                  return Text('No recipe found');
                }
              },




          )*/