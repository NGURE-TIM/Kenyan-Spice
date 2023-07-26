import 'package:flutter/material.dart';



class Select extends ChangeNotifier{
  bool Status1 = true;
  bool Status2 = false;
  bool Status3 = false;

 getStatus () {

 if( Status1==false)
   {
     Status1=true;
     Status2 = false;
     Status3 = false;
   }
else if (Status2 = false)
{
  Status1=false;
  Status2 = true;
  Status3 = false;
}
 else if (Status3= false)
 {
   Status1=false;
   Status2 = false;
   Status3 = true;
 }
  notifyListeners();
 }


}