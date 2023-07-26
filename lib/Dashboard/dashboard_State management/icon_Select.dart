import 'package:flutter/material.dart';



class Select extends ChangeNotifier{
  bool Status1 = true;
  bool Status2 = false;
  bool Status3 = false;

 getStatus () {

  notifyListeners();
 }


}