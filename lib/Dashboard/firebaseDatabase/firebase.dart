import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';





final CollectionReference recipes =
  FirebaseFirestore.instance.collection('recipe');



FutureBuilder<QuerySnapshot>(
future:recipes.get(),
builder:(BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot)
)