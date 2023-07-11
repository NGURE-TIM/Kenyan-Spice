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


// The below builds a horizontal scroll view section

SingleChildScrollView buildPopularandVegan() {
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:
      Row(
        children: [
        ],
      )

  );
}